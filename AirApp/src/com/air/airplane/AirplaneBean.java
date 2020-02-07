package com.air.airplane;

import java.sql.Date;

public class AirplaneBean {
	
	private String airname;
	private String depart;
	private String arrive;
	private int seat;
	private Date start;
	private Date end;
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
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	
	
	@Override
	public String toString() {
		return "AirplaneBean [airname=" + airname + ", depart=" + depart + ", arrive=" + arrive + ", seat=" + seat
				+ ", start=" + start + ", end=" + end + "]";
	}
	
	
	
}
