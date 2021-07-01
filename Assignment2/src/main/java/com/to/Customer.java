package com.to;

public class Customer {

	private String cid;
	private String firstname;
	private String lastname;
	private String phoneNo;
	private String city;
	private String dob;
	

	public Customer() {
		
	}

	public Customer(String cid, String firstname, String lastname,String phoneNo, String city, String dob ) {
		super();
		this.cid = cid;
		this.firstname = firstname;
		this.lastname = lastname;
		this.phoneNo = phoneNo;
		this.city = city;
		this.dob = dob;
		
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	
}
