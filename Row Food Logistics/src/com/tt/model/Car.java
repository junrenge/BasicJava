package com.tt.model;

public class Car {
	
	private int id;
	private String idname;
	private String type;
	private String device;
	private String tons;
	private String remain;
	private String standard;
	
	public Car(int id, String idname, String type, String device, String tons,
			String remain, String standard) {
		this.id = id;
		this.idname = idname;
		this.type = type;
		this.device = device;
		this.tons = tons;
		this.remain = remain;
		this.standard = standard;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIdname() {
		return idname;
	}

	public void setIdname(String idname) {
		this.idname = idname;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDevice() {
		return device;
	}

	public void setDevice(String device) {
		this.device = device;
	}

	public String getTons() {
		return tons;
	}

	public void setTons(String tons) {
		this.tons = tons;
	}

	public String getRemain() {
		return remain;
	}

	public void setRemain(String remain) {
		this.remain = remain;
	}

	public String getStandard() {
		return standard;
	}

	public void setStandard(String standard) {
		this.standard = standard;
	}
	
}
