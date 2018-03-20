package com.tt.model;

public class Line {

	private int id;
	private String idname;
	private String lines;
	private String type;
	private String time;
	
	public Line(int id, String idname, String lines, String type, String time) {
		this.id = id;
		this.idname = idname;
		this.lines = lines;
		this.type = type;
		this.time = time;
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

	public String getLines() {
		return lines;
	}

	public void setLines(String lines) {
		this.lines = lines;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
}
