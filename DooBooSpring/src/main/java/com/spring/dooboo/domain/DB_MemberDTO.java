package com.spring.dooboo.domain;

public class DB_MemberDTO {
	
	private String id;  
	private String email;
	private String password;
	private String name;
	private String phone;
	private String zonecode;
	private String address;
	private String addressdetail;
	private String sel_email;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZonecode() {
		return zonecode;
	}
	public void setZonecode(String zonecode) {
		this.zonecode = zonecode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressdetail() {
		return addressdetail;
	}
	public void setAddressdetail(String addressdetail) {
		this.addressdetail = addressdetail;
	}
	public String getSel_email() {
		return sel_email;
	}
	public void setSel_email(String sel_email) {
		this.sel_email = sel_email;
	}
	@Override
	public String toString() {
		return "DB_MemberDTO [id=" + id + ", email=" + email + ", password=" + password + ", name=" + name + ", phone="
				+ phone + ", zoneCode=" + zonecode + ", address=" + address + ", addressDetail=" + addressdetail
				+ ", sel_email=" + sel_email + "]";
	}
	
	
	
}
