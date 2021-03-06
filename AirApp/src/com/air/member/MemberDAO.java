package com.air.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.air.reserve.ReserveBean;




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
	public int insertMember(MemberBean mb){
		int check = -1;
		
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
			check = 1;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("가입 실패");
			check = 0;
		}finally{
			closeDB();
		}
		
		return check;
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
	
	//주민번호 중복체크
	public int joinJuminCheck(String jumin) {
		int jumincheck = -1;
		
		try {
			con = getConn();
			
			sql = "select jumin from member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				if(jumin.equals(rs.getString("jumin"))){
					System.out.println("jumin = " + rs.getString("jumin"));
					jumincheck = 1;
					break;
				}else{
					System.out.println("주민번호 사용 불가");
					jumincheck = 0;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
		return jumincheck;
	}
	
	//이메일 중복체크
	public int joinEmailCheck(String email) {
		int emailcheck = -1;
		
		try {
			con = getConn();
			
			sql = "select email from member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				if(email.equals(rs.getString("email"))){
					System.out.println("email = " + rs.getString("email"));
					emailcheck = 1;
					break;
				}else{
					System.out.println("이메일 사용 불가");
					emailcheck = 0;
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
		return emailcheck;
	}
	
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
	
	//회원 정보
	public MemberBean getMember(String id) {
	
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
	
	
	//회원 정보 수정
	public int updateMember(MemberBean mb) {
		int check = -1;
		
		try {
			
			con = getConn();
			
			sql = "select pass from member where id= ? ";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mb.getId());

			rs = pstmt.executeQuery();
						
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
	
	//회원 정보 삭제
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
	
	//회원 예약정보
	public ArrayList getMemberReserve(String id) {
		
		ArrayList<ReserveBean> reserveList = new ArrayList<ReserveBean>();
		
		try {
			con = getConn();
			sql = "select * from reserve where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ReserveBean rb = new ReserveBean();
				
				rb.setAirname(rs.getString("airname"));
				rb.setArrive(rs.getString("arrive"));
				rb.setDepart(rs.getString("depart"));
				rb.setId(rs.getString("id"));
				rb.setResname(rs.getString("resname"));
				rb.setSeat(rs.getInt("seat"));
				
				reserveList.add(rb);
				
				
			}
			System.out.println("멤버 예약 검색 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}

		return reserveList;
		
		
	}
	//getMemberReserve
	
	//회원 정보 리스트
	public ArrayList<MemberBean> getMemberList(){
		
		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
		
		try {
			
			con = getConn();
			
			sql = "select * from member";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				MemberBean mb = new MemberBean();
				
				mb.setId(rs.getString("id"));
				mb.setPass(rs.getString("pass"));
				mb.setName(rs.getString("name"));
				mb.setJumin(rs.getString("jumin"));
				mb.setEmail(rs.getString("email"));
				mb.setPhone(rs.getString("phone"));
				mb.setAddress(rs.getString("address"));
				
				memberList.add(mb);
			}
			
			System.out.println("회원 정보 검색 완료");
			
	
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
		
		
		return memberList;
	}
	//getMemberList
	
	
	
	
	
	
	
	
	
	
}
