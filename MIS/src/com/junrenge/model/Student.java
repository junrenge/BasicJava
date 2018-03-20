package com.junrenge.model;

import java.util.Date;

public class Student {
	private int id;
	private String sno;
	private String sname;
	private String sage;
	private String ssex;
	private String sid;
	private Date sbirth;
	private String sjiguan;
	private String sdorm;
	private String sphone;
	private String sstartyear;
	private String sstudymodel;
	private String sdept;
	private String sclass;
	private String spw;
    private String sgrade;
    
    public Student() {
	}
    
	public Student(int id, String sno, String sname, String sage, String ssex,
			String sid, Date sbirth, String sjiguan, String sdorm,
			String sphone, String sstartyear, String sstudymodel, String sdept,
			String sclass, String spw, String sgrade) {
		super();
		this.id = id;
		this.sno = sno;
		this.sname = sname;
		this.sage = sage;
		this.ssex = ssex;
		this.sid = sid;
		this.sbirth = sbirth;
		this.sjiguan = sjiguan;
		this.sdorm = sdorm;
		this.sphone = sphone;
		this.sstartyear = sstartyear;
		this.sstudymodel = sstudymodel;
		this.sdept = sdept;
		this.sclass = sclass;
		this.spw = spw;
		this.sgrade = sgrade;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getSage() {
		return sage;
	}

	public void setSage(String sage) {
		this.sage = sage;
	}

	public String getSsex() {
		return ssex;
	}

	public void setSsex(String ssex) {
		this.ssex = ssex;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public Date getSbirth() {
		return sbirth;
	}

	public void setSbirth(Date sbirth) {
		this.sbirth = sbirth;
	}

	public String getSjiguan() {
		return sjiguan;
	}

	public void setSjiguan(String sjiguan) {
		this.sjiguan = sjiguan;
	}

	public String getSdorm() {
		return sdorm;
	}

	public void setSdorm(String sdorm) {
		this.sdorm = sdorm;
	}

	public String getSphone() {
		return sphone;
	}

	public void setSphone(String sphone) {
		this.sphone = sphone;
	}

	public String getSstartyear() {
		return sstartyear;
	}

	public void setSstartyear(String sstartyear) {
		this.sstartyear = sstartyear;
	}

	public String getSstudymodel() {
		return sstudymodel;
	}

	public void setSstudymodel(String sstudymodel) {
		this.sstudymodel = sstudymodel;
	}

	public String getSdept() {
		return sdept;
	}

	public void setSdept(String sdept) {
		this.sdept = sdept;
	}

	public String getSclass() {
		return sclass;
	}

	public void setSclass(String sclass) {
		this.sclass = sclass;
	}

	public String getSpw() {
		return spw;
	}

	public void setSpw(String spw) {
		this.spw = spw;
	}

	public String getSgrade() {
		return sgrade;
	}

	public void setSgrade(String sgrade) {
		this.sgrade = sgrade;
	}
	
}
