package com.air.reserve;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.air.airplane.AirplaneBean;

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
	
	
	public ArrayList serchAirplane(String depart, String arrive) {
		
		ArrayList<AirplaneBean> airplaneList = new ArrayList<AirplaneBean>();

		try {
			con = getConn();
			
			sql = "select * from airplane where depart = ? and arrive = ?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, depart);
			pstmt.setString(2, arrive);
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
		}finally{
			closeDB();
		}
		
		return airplaneList;
	}
	
	
	public int insertReserve(ReserveBean rb) {
		int check = -1;
		
		
		try {
			con = getConn();
			
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
			
			check =1;
			
		} catch (Exception e) {
			e.printStackTrace();
			check =0;
		}finally{
			closeDB();
		}
		
		return check;
		
		
		
		
	}
	
	
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
	
	public int deleteReserve(String resname, String id, String pass) {
		int check = -1;
		
		try {
			con= getConn();
			
			sql = "select * from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(pass.equals(rs.getString("pass"))){
					System.out.println("비밀번호 동일");
					sql = "delete from reserve where resname = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, resname);
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
	
}
