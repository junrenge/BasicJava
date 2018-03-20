package com.junrenge.model;

public class SelectedClass {
	private int id;
	private String cno;
	private String cname;
	private String sno;
	private String sname;
	private String tno;
	private String tname;
	private String grade;
	private String credit;
	private String jidian;
	private String cj;

	public SelectedClass() {
	}

	public SelectedClass(int id, String cno, String cname, String sno,
			String sname, String tno, String tname, String grade,String credit,String jidian,String cj) {
		super();
		this.id = id;
		this.cno = cno;
		this.cname = cname;
		this.sno = sno;
		this.sname = sname;
		this.tno = tno;
		this.tname = tname;
		this.grade = grade;
		this.credit = credit;
		this.jidian = jidian;
		this.cj = cj;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
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

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getCredit() {
		return credit;
	}

	public void setCredit(String credit) {
		this.credit = credit;
	}

	public String getJidian() {
		return jidian;
	}

	public void setJidian(String jidian) {
		this.jidian = jidian;
	}

	public String getCj() {
		return cj;
	}

	public void setCj(String cj) {
		this.cj = cj;
	}
	
}
