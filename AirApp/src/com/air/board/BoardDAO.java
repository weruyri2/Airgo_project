package com.air.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class BoardDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	private Connection getConn() throws Exception {
		
		try {
			Context initCtx = new InitialContext();
			DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/AirWebDB");
			con = ds.getConnection();
			System.out.println("드라이버 & DB 연결 성공");
		}catch (Exception e){
			e.printStackTrace();
			System.out.println("드라이버 & DB 연결 실패");
		}
		return con;
	}
	
	public void closeDB() {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	///////////////////////////////////////////////
	
	
	// insertBoard(bb)
	public void insertBoard(BoardBean bb) {
		System.out.println("BoardDAO-insetBoard 호출 !!");
		
		int num = 0;

		try {
			// 디비 연결
			con = getConn();
		
			//3 SQL 작성
			sql = "select max(num) from board";
			pstmt = con.prepareStatement(sql);
			//4 SQL 실행
			rs = pstmt.executeQuery();
			
			//5 rs
			if(rs.next()){
//				num = rs.getInt("max(num)") + 1;
				num = rs.getInt(1) + 1;
				// => select 결과의 첫번째 인덱스 컬럼의 값을 가져오는 동작
			}
			
			System.out.println("num : "+num);
			
			// num + 전달한 정보 bb를 DB테이블에 저장
			// 글쓰기
			sql = "insert into "
					+ "board(num,name,pass,subject,content,readcount,"
					+ "re_ref,re_lev,re_seq,date,ip,file)"
					+ "values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			
			// now() -> DB에 시간 정보를 가져오는 함수
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0); //read count 조회수는 0
			pstmt.setInt(7, num);	//re_ref 답변글 그룹->일반글의 글번호와 동일
			pstmt.setInt(8, 0); //re_lev 답변글 들여쓰기
			pstmt.setInt(9, 0); //re_seq 답변글 순서
			
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11, bb.getFile());
			
			//4
			pstmt.executeUpdate();
			
			System.out.println(" 글쓰기 완료 !!!");
			
			
		} catch (Exception e) {
			System.out.println("글쓰기 오류!!!!!!");
			e.printStackTrace();
		} finally {
			closeDB();
		}


	}
	// insertBoard(bb)

	
	//getBoardCount()
	public int getBoardCount() {
		
		int cnt = 0;
		
		
		try {
			
			con = getConn();
			
			sql = "select count(num) from board";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				cnt = rs.getInt(1);
				System.out.println(cnt+"개의 글이 있습니다.");
			}else{
				System.out.println("글이 없습니다.");
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		

		
		return cnt;
	}
	//getBoardCount()
	
	
	//getBoardList1(int idx, int page)
	public ArrayList getBoardList1(int idx, int page) {
		ArrayList<BoardBean> BoardList = new ArrayList<BoardBean>();
			
		try {
			
			con = getConn();
			
			page = 3;
			
			int row = 0; 
					
			sql = "select * from board order by num desc limit ?, ?";
		
		
			pstmt = con.prepareStatement(sql);
						
			pstmt.setInt(1, row);
			pstmt.setInt(2, idx);
						
			row = row+idx;
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardBean bb = new BoardBean();
				
				bb.setName(rs.getString("name"));
				bb.setSubject(rs.getString("subject"));
				bb.setDate(rs.getDate("date"));
				
				BoardList.add(bb);
			}
			
			System.out.println("idx = " + idx);
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		

		return BoardList;
	}
	//getBoardList1(int idx, int page)
	
	
	//getBoardListAll()
	public List getBoardListAll() {
		
		List boardList = new ArrayList();
		
		try {
			
			// 1,2 디비연결
			con = getConn();
			
			// 3 sql
			sql = "select * from board";
			
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardBean bb = new BoardBean();
				
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setDate(rs.getDate("date"));
				bb.setIp(rs.getString("ip"));
				bb.setFile(rs.getString("file"));
				
				boardList.add(bb);
			}
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return boardList;
		
	}
	//getBoardListAll()
	
	
	//getBoardList(int startRow, int pageSize)
	public ArrayList<BoardBean> getBoardList(int startRow, int pageSize) {
		
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
		
		try {
			con = getConn();
			
			sql = "select * from board "
					+ "order by re_ref desc, re_seq asc "
					+ "limit ?,?";
			pstmt = con.prepareStatement(sql);
		
			pstmt.setInt(1, startRow-1); // 시작행 - 1
			pstmt.setInt(2, pageSize); // 페이지 크기
			
			rs = pstmt.executeQuery();
			
			
			// DB 정보 -> BoardBean 저장 -> boardList 한칸에 저장
			
			while(rs.next()){
				BoardBean bb = new BoardBean();
				
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setDate(rs.getDate("date"));
				bb.setIp(rs.getString("ip"));
				bb.setFile(rs.getString("file"));
				
				boardList.add(bb);
			}
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}

		
		return boardList;
	}
	//getBoardList(int startRow, int pageSize)
	
	
	//updateReadCount(int num)
	public void updateReadCount(int num) {
		//디비 연결
		try {
			
			con = getConn();
			
			
			//3 SQL (update) : num 해당하는 글정보중 조회수 (readcount)1증가
			sql = "update board set readcount = readcount+1 where num = ?";
		
			
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();

			System.out.println("글 조회수 1증가 완료");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		

	
	}
	//updateReadCount(int num)
	
	
	//getBoard(int num)
	public BoardBean getBoard(int num) {
		BoardBean bb = null;
		
		
		try {
			con = getConn();
			
			sql = "select * from board where num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				bb = new BoardBean();
				
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setDate(rs.getDate("date"));
				bb.setIp(rs.getString("ip"));
				bb.setFile(rs.getString("file"));
				
				System.out.println("정보 조회 성공! " +bb.toString());
				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}

		return bb;
	}
	//getBoard(int num)
	
	
	//updateBoard(BoardBean bb)
	public int updateBoard(BoardBean bb){
		
		int check = -1;
		System.out.println("update 확인");

		try {
			con = getConn();
			
			if(bb.getPass()==null) {
				check=0;
				return check;
			}
			
			sql = "select pass from board where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
	
			//실행
			rs = pstmt.executeQuery();
			
						
			if(rs.next()){
				//글 있음
				if(bb.getPass().equals(rs.getString("pass"))){
					//비밀번호 같음
					
					sql = "update board set name=?, subject=?, content=? where num= ? ";

					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, bb.getName());
					pstmt.setString(2, bb.getSubject());
					pstmt.setString(3, bb.getContent());
					pstmt.setInt(4, bb.getNum());

					check = pstmt.executeUpdate();
					
				}else{
					//비밀번호 오류
					System.out.println("비밀번호 오류");
					check = 0;
				}
				
			}else{
				//글번호 없음
				System.out.println("글번호없음");
				check = -1;
			}
						
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
		return check;

		
	}
	//updateBoard(BoardBean bb)
	
	
	//deleteBoard(int num, String pass)
	public int deleteBoard(int num, String pass) {
		int check = -1;
		
		System.out.println("deleteBoard 확인");
		
		
		try {
			
			con = getConn();
			
			sql = "select pass from board where num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(pass.equals(rs.getString("pass"))){
					check=1;
					sql = "delete from board where num = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					System.out.println("삭제 완료");
				}else{
					check=0;
					System.out.println("비밀번호 오류");
				}
			}else{
				check=-1;
				System.out.println("글 존재하지 않음");
			}
		
		
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
				
		
		return check;
		
	}
	//deleteBoard(int num, String pass)
	
	
	//reInsertBoard(BoardBean bb)
	public void reInsertBoard(BoardBean bb){
		
		int num = 0;
		// 디비 연결
	
		//3 SQL 작성

		try {
			con = getConn();
			
			sql = "select max(num) from board";
			pstmt = con.prepareStatement(sql);
			//4 SQL 실행
			rs = pstmt.executeQuery();
			
			//5 rs
			if(rs.next()){
//				num = rs.getInt("max(num)") + 1;
				num = rs.getInt(1) + 1;
				// => select 결과의 첫번째 인덱스 컬럼의 값을 가져오는 동작
			}
			
			System.out.println("답글 번호 : "+num);
			
			
			sql = "update board set re_seq=re_seq+1 "
					+ "where re_ref=? and re_seq>? ";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bb.getRe_ref());
			pstmt.setInt(2, bb.getRe_seq());
			
			//4
			pstmt.executeUpdate();
			System.out.println(" 답글 재정렬 완료 @@");
			
			// num + 전달한 정보 bb를 DB테이블에 저장
			// 답글쓰기
			sql = "insert into "
						+ "board(num,name,pass,subject,content,readcount,"
						+ "re_ref,re_lev,re_seq,date,ip,file)"
						+ "values(?,?,?,?,?,?,?,?,?,now(),?,?)";
				
				// now() -> DB에 시간 정보를 가져오는 함수
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, bb.getName());
				pstmt.setString(3, bb.getPass());
				pstmt.setString(4, bb.getSubject());
				pstmt.setString(5, bb.getContent());
				pstmt.setInt(6, 0); //read count 조회수는 0
				pstmt.setInt(7, bb.getRe_ref());	//re_ref 답변글 그룹->일반글의 글번호와 동일
				pstmt.setInt(8, bb.getRe_lev()+1); //re_lev 답변글 들여쓰기
				pstmt.setInt(9, bb.getRe_seq()+1); //re_seq 답변글 순서
				
				pstmt.setString(10, bb.getIp());
				pstmt.setString(11, bb.getFile());
				
				//4
				pstmt.executeUpdate();
				
				System.out.println(" 답글 쓰기 완료 !!!");

			
		} catch (Exception e) {
			System.out.println("답글 쓰기 오류!!!!!!");
			e.printStackTrace();
		} finally {
			closeDB();
		}

		
		

	}
	//reInsertBoard(BoardBean bb)
	
	

}
