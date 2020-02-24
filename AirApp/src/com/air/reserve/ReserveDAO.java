package com.air.reserve;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.air.airplane.AirplaneBean;
import com.air.airplane.AirplaneDAO;

public class ReserveDAO {

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
	
	
	//serchAirplane(String depart, String arrive,Date start,Date end)
	public ArrayList serchAirplane(String depart, String arrive,Date start,Date end) {
		
		ArrayList<AirplaneBean> airplaneList = new ArrayList<AirplaneBean>();

		try {
			con = getConn();
			
			sql = "select * from airplane where depart = ? and arrive = ? and start >= ? and end <= ?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, depart);
			pstmt.setString(2, arrive);
			pstmt.setDate(3, start);
			pstmt.setDate(4, end);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				AirplaneBean ab = new AirplaneBean();
			
				ab.setAirname(rs.getString("airname"));
				ab.setDepart(rs.getString("depart"));
				ab.setArrive(rs.getString("arrive"));
				ab.setSeat(rs.getInt("seat"));
				ab.setStart(rs.getDate("start"));
				ab.setEnd(rs.getDate("end"));
				
				airplaneList.add(ab);
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("맞는 비행기 없음");
		}finally{
			closeDB();
		}
		
		return airplaneList;
	}
	//serchAirplane(String depart, String arrive,Date start,Date end)
	
	
	//insertReserve(ReserveBean rb)
	public int insertReserve(ReserveBean rb) {
		int check = -1;
		
		AirplaneDAO adao = new AirplaneDAO();
		AirplaneBean ab = adao.getAirPlane(rb.getAirname());
			
		try {
			
			con = getConn();
			
			if(ab.getSeat()-rb.getSeat()<0) {
				System.out.println("좌석 수 오버");
				check = -2;
			}else{
			
			
				sql = "insert into reserve (resname,id,airname,depart,arrive,seat)"
						+ " values (?, ?, ?, ?, ?, ?)";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, rb.getResname());
				pstmt.setString(2, rb.getId());
				pstmt.setString(3, rb.getAirname());
				pstmt.setString(4, rb.getDepart());
				pstmt.setString(5, rb.getArrive());
				pstmt.setInt(6, rb.getSeat());
				
				pstmt.executeUpdate();
				
				System.out.println("예약 완료");
				
				sql ="update airplane set seat = seat-? where airname = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rb.getSeat());
				pstmt.setString(2, rb.getAirname());
				
				pstmt.executeUpdate();
				
				System.out.println("좌석수 적용 완료");
				
				check =1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			check =0;
		}finally{
			closeDB();
		}
		
		return check;
		
			
	}
	//insertReserve(ReserveBean rb)
	
	
	//getReserveList
	public ArrayList getReserveList() {
		
		ArrayList<ReserveBean> reserveList = new ArrayList<ReserveBean>();
		
		try {
			con = getConn();
			sql = "select * from reserve";
			pstmt = con.prepareStatement(sql);
			
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
			System.out.println("예약 정보 검색 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}

		return reserveList;
		
		
	}
	//getReserveList
	
	
	
	//updateReserve(ReserveBean rb)
	public int updateReserve(ReserveBean rb) {
		int check = -1;
		
		try {
			
			con = getConn();
			
	
					sql = "update reserve set airname = ?, depart = ?, arrive = ?, seat = ? where resname = ?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, rb.getAirname());
					pstmt.setString(2, rb.getDepart());
					pstmt.setString(3, rb.getArrive());
					pstmt.setInt(4, rb.getSeat());
					pstmt.setString(5, rb.getResname());
					
					pstmt.executeUpdate();
					
					System.out.println("정보 수정 완료");
					check = 1;

		} catch (Exception e) {
			e.printStackTrace();
			check = 0;
		} finally {
			closeDB();
		}
		
		return check;
	}
	
	public int deleteReserve(ReserveBean rb, String pass) {
		int check = -1;
		
		try {
			con= getConn();
			
			sql = "select * from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rb.getId());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(pass.equals(rs.getString("pass"))){
					System.out.println("비밀번호 동일");
					sql = "update airplane set seat = seat+? where airname = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, rb.getSeat());
					pstmt.setString(2, rb.getAirname());
					pstmt.executeUpdate();
					
					System.out.println("좌석수 복구 완료");
					
					
					
					sql = "delete from reserve where resname = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, rb.getResname());
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
			e.printStackTrace();
			check=0;
		}finally{
			closeDB();
		}
		
		return check;
			
	}
	//updateReserve(ReserveBean rb)
	
	
	//ReserveBean getReserve(String resname)
	public ReserveBean getReserve(String resname){
		
		ReserveBean rb = new ReserveBean();
		
		try {
			con = getConn();
			
			sql = "select * from Reserve where resname = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, resname);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				rb.setAirname(rs.getString("airname"));
				rb.setDepart(rs.getString("depart"));
				rb.setArrive(rs.getString("arrive"));
				rb.setId(rs.getString("id"));
				rb.setResname(rs.getString("resname"));
				rb.setSeat(rs.getInt("seat"));
				
				System.out.println("예약 rb 저장 완료");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return rb;
	}
	//ReserveBean getReserve(String resname)
	
	
	
}
