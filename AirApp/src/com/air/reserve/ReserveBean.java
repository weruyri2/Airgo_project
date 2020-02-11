package com.air.reserve;

public class ReserveBean {
	
	private String resname;
	private String id;
	private String airname;
	private String depart;
	private String arrive;
	private int seat;
	
	
	public String getResname() {
		return resname;
	}
	public void setResname(String resname) {
		this.resname = resname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAirname() {
		return airname;
	}
	public void setAirname(String airname) {
		this.airname = airname;
	}
	
	public String getDepart() {
		return depart;
	}
	public void setDepart(String depart) {
		this.depart = depart;
	}
	public String getArrive() {
		return arrive;
	}
	public void setArrive(String arrive) {
		this.arrive = arrive;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}
	
	
	@Override
	public String toString() {
		return "ReserveBean [resname=" + resname + ", id=" + id + ", airname=" + airname + ", depart=" + depart
				+ ", arrive=" + arrive + ", seat=" + seat + "]";
	}
	
	
}
