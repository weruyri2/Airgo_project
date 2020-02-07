package com.air.airplane;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
			
			sql = "insert into airplane ('airname','depart','arrive','seat','start','end')"
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
	
}
