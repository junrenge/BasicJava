package com.junrenge.model;

public class Plan {
	private int id;
	private String grade;
	private String clazz;
	private String major;
	private String term;
	private String cno;
	private String cname;

	private void paln() {
	}

	public Plan(int id, String grade, String clazz, String major, String term,
			String cno, String cname) {
		super();
		this.id = id;
		this.grade = grade;
		this.clazz = clazz;
		this.major = major;
		this.term = term;
		this.cno = cno;
		this.cname = cname;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getClazz() {
		return clazz;
	}

	public void setClazz(String clazz) {
		this.clazz = clazz;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}
	
}
