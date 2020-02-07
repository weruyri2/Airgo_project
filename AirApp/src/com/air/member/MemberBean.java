package com.air.member;

public class MemberBean {
	
	private String id;
	private String pass;
	private String name;
	private String jumin;
	private String email;
	private String phone;
	private String address;
	private String poket;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPoket() {
		return poket;
	}
	public void setPoket(String poket) {
		this.poket = poket;
	}
	
	@Override
	public String toString() {
		return "MemberBean [id=" + id + ", pass=" + pass + ", name=" + name + ", jumin=" + jumin + ", email=" + email
				+ ", phone=" + phone + ", address=" + address + ", poket=" + poket + "]";
	}
	
	
}
