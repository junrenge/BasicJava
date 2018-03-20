package com.tt.model;

public class Goods {
	
	private int id;
	private String name;
	private String tem;
	private String humidity;
	
	public Goods(int id, String name, String tem, String humidity) {
		this.id = id;
		this.name = name;
		this.tem = tem;
		this.humidity = humidity;
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

	public String getTem() {
		return tem;
	}

	public void setTem(String tem) {
		this.tem = tem;
	}

	public String getHumidity() {
		return humidity;
	}

	public void setHumidity(String humidity) {
		this.humidity = humidity;
	}
	
}
