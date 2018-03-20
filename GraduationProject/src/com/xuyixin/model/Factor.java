package com.xuyixin.model;

public class Factor {
	//实体类主键
	private int id;
	//风险因素名称
	private String fname;
	//从属的风险类型的id
	private String rid;
	
	public Factor() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}
	

}
