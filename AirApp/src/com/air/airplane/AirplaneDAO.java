package com.air.airplane;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class AirplaneDAO {
	
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
	
	
	public void insertAirplane(AirplaneBean ab) {
		
		try {
			con = getConn();
			
			sql = "insert into airplane (airname,depart,arrive,seat,start,end)"
					+ " values (?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ab.getAirname());
			pstmt.setString(2, ab.getDepart());
			pstmt.setString(3, ab.getArrive());
			pstmt.setInt(4, ab.getSeat());
			pstmt.setDate(5, ab.getStart());
			pstmt.setDate(6, ab.getEnd());
			
			pstmt.executeUpdate();
			
			System.out.println("생성 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("생성 실패");
		}finally{
			closeDB();
		}
	}
	
	
	public AirplaneBean getAirPlane() {
		System.out.println("getAirPlane 호출");
		
		AirplaneBean ab = null;
		
		try {
			con = getConn();
			
			sql = "select * from airplane";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				ab = new AirplaneBean();
				
				ab.setAirname(rs.getString("airname"));
				ab.setDepart(rs.getString("depart"));
				ab.setArrive(rs.getString("arrive"));
				ab.setSeat(rs.getInt("seat"));
				ab.setStart(rs.getDate("start"));
				ab.setEnd(rs.getDate("end"));
				
				System.out.println("비행기 정보 : " +ab);
			}
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}

		return ab;
	}
	
	public ArrayList getAirplaneList() {
	
		ArrayList<AirplaneBean> airplaneList = new ArrayList<AirplaneBean>();

			try {

				sql = "select * from airplane";
				pstmt = con.prepareStatement(sql);
					
				rs  = pstmt.executeQuery();
				
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
				System.out.println("비행기 정보 검색 완료 ! ");
					
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();				
			}
				
		return airplaneList;
	}
	
	
}
