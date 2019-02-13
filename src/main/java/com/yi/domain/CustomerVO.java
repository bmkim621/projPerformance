package com.yi.domain;

public class CustomerVO {
	private String customerCode;
	private String customerName;
	private String id;
	private String password;
	private String email;
	private String phone;
	private String dob;
	private String address;
	
	public CustomerVO() {
		// TODO Auto-generated constructor stub
	}

	public CustomerVO(String customerCode, String customerName, String id, String password, String email, String phone,
			String dob, String address) {
		this.customerCode = customerCode;
		this.customerName = customerName;
		this.id = id;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.dob = dob;
		this.address = address;
	}

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return String.format(
				"CustomerVO [customerCode=%s, customerName=%s, id=%s, password=%s, email=%s, phone=%s, dob=%s, address=%s]",
				customerCode, customerName, id, password, email, phone, dob, address);
	}
	
	
}
