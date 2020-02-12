package com.air.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;




public class MemberDAO {
	
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
	
	//회원 가입
	public void insertMember(MemberBean mb){
		
		try {
			con = getConn();
			
			sql = "insert into "
					+ "member(id,pass,name,jumin,email,phone,address)"
					+ "values(?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			pstmt.setString(2,mb.getPass());
			pstmt.setString(3,mb.getName());
			pstmt.setString(4,mb.getJumin());
			pstmt.setString(5,mb.getEmail());
			pstmt.setString(6,mb.getPhone());
			pstmt.setString(7,mb.getAddress());
			
			pstmt.executeUpdate();
			
			System.out.println("가입 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("가입 실패");
		}finally{
			closeDB();
		}
	}
	//insertMember
	
	//아이디 중복체크
	public int joinIdCheck(String id) {
		int idcheck = -1;
		
		try {
			con = getConn();
			
			sql = "select id from member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				if(id.equals(rs.getString("id"))){
					System.out.println("id = " + rs.getString("id"));
					idcheck = 1;
					break;
				}else{
					System.out.println("아이디 사용 불가");
					idcheck = 0;
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
		return idcheck;
	}
	//joinIdCheck
	
	//회원 로그인
	public int LoginCheck(String id, String pass) {
		int check = -1;
		
		try {
			con = getConn();
			
			sql = "select pass from member where id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				if(pass.equals(rs.getString("pass"))){
					check = 1;
					System.out.println("로그인 성공");
				}else{
					check = 0;
					System.out.println("비밀빈호 오류");
				}
				
			}else{
				System.out.println("아이디 오류");
				check = -1;
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
		return check;
	}
	//loginCheck
	
	//getMember
	public MemberBean getMember(String id) {
		System.out.println("MemberDAO-getMember 호출");
	
		MemberBean mb = null;
		
		try {
			con = getConn();
	
			sql = "select * from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs  = pstmt.executeQuery();
			
			if(rs.next()){
				mb = new MemberBean();
				
				// DB에 저장된정보(rs) -> MemberBean 담아서 이동(info.jsp)
				mb.setId(rs.getString("id"));
				mb.setPass(rs.getString("pass"));
				mb.setName(rs.getString("name"));
				mb.setJumin(rs.getString("jumin"));
				mb.setEmail(rs.getString("email"));
				mb.setPhone(rs.getString("phone"));
				mb.setAddress(rs.getString("address"));
				mb.setPoket(rs.getString("poket"));	
				
				System.out.println("회원 정보 검색 완료 ! :" + mb);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
		return mb;
		
	}
	//getMember
	
	
	//updateMember
	public int updateMember(MemberBean mb) {
		int check = -1;
		
		try {
			
			con = getConn();
			
			sql = "select pass from member where id= ? ";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mb.getId());
			
			//4
			rs = pstmt.executeQuery();
			
			//5
			
			if(rs.next()){
				if(mb.getPass().equals(rs.getString("pass"))){
					
					sql = "update member set name = ?, jumin = ?, email = ?, phone = ?, address =? where id = ?";
					pstmt = con.prepareStatement(sql);
						
					pstmt.setString(1, mb.getName());
					pstmt.setString(2, mb.getJumin());
					pstmt.setString(3, mb.getEmail());
					pstmt.setString(4, mb.getPhone());
					pstmt.setString(5, mb.getAddress());
					pstmt.setString(6, mb.getId());
						
					pstmt.executeUpdate();

					
					System.out.println("정보 수정 완료");
					check = 1;
					
				}else{
					check = 0;
				}
				
			}else {
				check = -1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return check;
	}
	//updateMember
	
	//deleteMember
	public int deleteMember(String id, String pass) {
		System.out.println("deleteMember");
		int check = -1;
		
		try {
			con = getConn();
			
			sql = "select * from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(pass.equals(rs.getString("pass"))){
					System.out.println("비밀번호 동일");
					
					sql = "delete from member where id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					
					System.out.println("삭제 완료");
					check=1;
				}else{
					System.out.println("비밀번호 오류");
					check=0;
				}
			}else{
				check=-1;
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
		return check;
	}
	//deleteMember
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
