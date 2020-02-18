package com.air.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CometDAO {

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

	
	public ArrayList<CometBean> cometList(int num){
		
		ArrayList<CometBean> cometList = new ArrayList<CometBean>();
		
		
		try {
			
			con = getConn();
			
			sql = "select id, content from comet where board_num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				CometBean cb = new CometBean();
				
				cb.setId(rs.getString("id"));
				cb.setContent(rs.getString("content"));
				
				cometList.add(cb);
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}

		return cometList;
	}
	
	
	public void insertComet(CometBean cb) {
		
		int num = 0;

		try {
			con = getConn();
		
			sql = "select max(num) from comet where board_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cb.getBoard_num());

			rs = pstmt.executeQuery();
			
			//5 rs
			if(rs.next()){
//				num = rs.getInt("max(num)") + 1;
				num = rs.getInt(1) + 1;
				// => select 결과의 첫번째 인덱스 컬럼의 값을 가져오는 동작
			}
			
			System.out.println("num : "+num);
			
			// num + 전달한 정보 cb를 DB테이블에 저장
			// 댓글쓰기
			sql = "insert into "
					+ "comet(num,id,board_num,content,re_ref,re_lev,re_seq)"
					+ "values(?,?,?,?,?,?,?)";
			
			// now() -> DB에 시간 정보를 가져오는 함수
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, cb.getId());
			pstmt.setInt(3, cb.getBoard_num());
			pstmt.setString(4, cb.getContent());
			pstmt.setInt(5, num);	//re_ref 답변글 그룹->일반글의 글번호와 동일
			pstmt.setInt(6, 0); //re_lev 답변글 들여쓰기
			pstmt.setInt(7, 0); //re_seq 답변글 순서
			
			//4
			pstmt.executeUpdate();
			
			System.out.println(" 댓글  쓰기 완료 !!!");
			
			
		} catch (Exception e) {
			System.out.println("글쓰기 오류!!!!!!");
			e.printStackTrace();
		} finally {
			closeDB();
		}

	
		
		
	}
	//insertBoard(bb)
	
	
	
	
	
	
	
	
	
	
	
}
