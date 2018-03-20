package com.xuyixin.model;

import com.xuyixin.servlet.eval1Servlet;

public class Eva {
	//实体类主键
	private int id;
	//评价集
	private String names;
	//评价分数集
	private String credits;
	//集合的元素个数
	private String num;
	
	public Eva() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNames() {
		return names;
	}

	public void setNames(String names) {
		this.names = names;
	}

	public String getCredits() {
		return credits;
	}

	public void setCredits(String credits) {
		this.credits = credits;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}
	

}
