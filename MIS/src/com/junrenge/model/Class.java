package com.junrenge.model;

public class Class {
	private int id;
	private String cno;
	private String cname;
	private String cgrade;
	private String ctime;
	private String cplace;
	private String ccredit;
	private String ctype;
	private String cweekday;
	private String ctag;
	private String cclass;
	private String cterm;

	public Class() {
	}

	public Class(int id, String cno, String cname, String cgrade, String ctime,
			String cplace, String ccredit, String ctype, String cweekday,String ctag,String cclass, String cterm) {
		super();
		this.id = id;
		this.cno = cno;
		this.cname = cname;
		this.cgrade = cgrade;
		this.ctime = ctime;
		this.cplace = cplace;
		this.ccredit = ccredit;
		this.ctype = ctype;
		this.cweekday = cweekday;
		this.ctag = ctag;
		this.cclass = cclass;
		this.cterm = cterm;
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

	public String getCgrade() {
		return cgrade;
	}

	public void setCgrade(String cgrade) {
		this.cgrade = cgrade;
	}

	public String getCtime() {
		return ctime;
	}

	public void setCtime(String ctime) {
		this.ctime = ctime;
	}

	public String getCplace() {
		return cplace;
	}

	public void setCplace(String cplace) {
		this.cplace = cplace;
	}

	public String getCcredit() {
		return ccredit;
	}

	public void setCcredit(String ccredit) {
		this.ccredit = ccredit;
	}

	public String getCtype() {
		return ctype;
	}

	public void setCtype(String ctype) {
		this.ctype = ctype;
	}

	public String getCweekday() {
		return cweekday;
	}

	public void setCweekday(String cweekday) {
		this.cweekday = cweekday;
	}

	public String getCtag() {
		return ctag;
	}

	public void setCtag(String ctag) {
		this.ctag = ctag;
	}

	public String getCclass() {
		return cclass;
	}

	public void setCclass(String cclass) {
		this.cclass = cclass;
	}

	public String getCterm() {
		return cterm;
	}

	public void setCterm(String cterm) {
		this.cterm = cterm;
	}
	
}
