package com.tt.model;

public class Order {
	
	private int id;
	private String enterprise1;
	private String name1;
	private String phone1;
	private String email1;
	private String address;
	private String name2;
	private String phone2;
	private String email2;
	private String address2;
	private String goods_name;
	private String goods_weight;
	private String goods_tem;
	private String goods_time;
	private String line;
	private String review;
	private String plan;
	private String status;
	private String finish;
	private String receive;
	private String carid;
	private String carname;
	
	public Order(int id, String enterprise1, String name1, String phone1,
			String email1, String address, String name2, String phone2,
			String email2, String address2, String goods_name,
			String goods_weight, String goods_tem, String goods_time,
			String line, String review, String plan, String status,
			String finish, String receive, String carid, String carname) {
		this.id = id;
		this.enterprise1 = enterprise1;
		this.name1 = name1;
		this.phone1 = phone1;
		this.email1 = email1;
		this.address = address;
		this.name2 = name2;
		this.phone2 = phone2;
		this.email2 = email2;
		this.address2 = address2;
		this.goods_name = goods_name;
		this.goods_weight = goods_weight;
		this.goods_tem = goods_tem;
		this.goods_time = goods_time;
		this.line = line;
		this.review = review;
		this.plan = plan;
		this.status = status;
		this.finish = finish;
		this.receive = receive;
		this.carid = carid;
		this.carname = carname;
	}
	public String getCarid() {
		return carid;
	}
	public void setCarid(String carid) {
		this.carid = carid;
	}
	public String getCarname() {
		return carname;
	}
	public void setCarname(String carname) {
		this.carname = carname;
	}
	public String getLine() {
		return line;
	}
	public void setLine(String line) {
		this.line = line;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEnterprise1() {
		return enterprise1;
	}
	public void setEnterprise1(String enterprise1) {
		this.enterprise1 = enterprise1;
	}
	public String getName1() {
		return name1;
	}
	public void setName1(String name1) {
		this.name1 = name1;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getName2() {
		return name2;
	}
	public void setName2(String name2) {
		this.name2 = name2;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_weight() {
		return goods_weight;
	}
	public void setGoods_weight(String goods_weight) {
		this.goods_weight = goods_weight;
	}
	public String getGoods_tem() {
		return goods_tem;
	}
	public void setGoods_tem(String goods_tem) {
		this.goods_tem = goods_tem;
	}
	public String getGoods_time() {
		return goods_time;
	}
	public void setGoods_time(String goods_time) {
		this.goods_time = goods_time;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getPlan() {
		return plan;
	}
	public void setPlan(String plan) {
		this.plan = plan;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFinish() {
		return finish;
	}
	public void setFinish(String finish) {
		this.finish = finish;
	}
	public String getReceive() {
		return receive;
	}
	public void setReceive(String receive) {
		this.receive = receive;
	}

	
}
