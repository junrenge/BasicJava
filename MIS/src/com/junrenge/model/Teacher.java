package com.junrenge.model;

public class Teacher {
	private int id;
	private String tno;
	private String tname;
	private String tage;
	private String tsex;
	private String tpw;
	private String cno;

	public Teacher() {
	}

	public Teacher(int id, String tno, String tname, String tage, String tsex,
			String tpw,String cno) {
		super();
		this.id = id;
		this.tno = tno;
		this.tname = tname;
		this.tage = tage;
		this.tsex = tsex;
		this.tpw = tpw;
		this.cno = cno;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTno() {
		return tno;
	}

	public void setTno(String tno) {
		this.tno = tno;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getTage() {
		return tage;
	}

	public void setTage(String tage) {
		this.tage = tage;
	}

	public String getTsex() {
		return tsex;
	}

	public void setTsex(String tsex) {
		this.tsex = tsex;
	}

	public String getTpw() {
		return tpw;
	}

	public void setTpw(String tpw) {
		this.tpw = tpw;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}
	
}
