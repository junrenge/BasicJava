package com.tt.model;

public class Client {

	private int id;
	private String enterprise_name;
	private String type;
	private String client_name;
	private String password;
	private String phone;
	private String email;
	private String address;
	private String cnumber;
	public Client(int id, String enterprise_name, String type,
			String client_name, String password, String phone, String email,
			String address, String cnumber) {
		super();
		this.id = id;
		this.enterprise_name = enterprise_name;
		this.type = type;
		this.client_name = client_name;
		this.password = password;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.cnumber = cnumber;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEnterprise_name() {
		return enterprise_name;
	}
	public void setEnterprise_name(String enterprise_name) {
		this.enterprise_name = enterprise_name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCnumber() {
		return cnumber;
	}
	public void setCnumber(String cnumber) {
		this.cnumber = cnumber;
	}
	
	
}
