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
	
	
	public void insertReserve(ReserveBean rb) {
		
		try {
			con = getConn();
			
			sql = "insert into reserve (resname,id,airname)"
					+ " values (?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.executeQuery();
			
			System.out.println("예약 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
		
		
		
		
		
	}
	
}
