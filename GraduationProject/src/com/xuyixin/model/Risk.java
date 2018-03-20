package com.xuyixin.model;

public class Risk {
	
	//实体类主键
	private int id;
	
	//风险类型名称
	private String name;
	
	//该类型下风险因素的个数
	private int factornum;
	
	public Risk() {
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getFactornum() {
		return factornum;
	}
	public void setFactornum(int factornum) {
		this.factornum = factornum;
	}
	
	

}
