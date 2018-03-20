package com.junrenge.impl;

import java.util.List;

import com.junrenge.dao.DAO;
import com.junrenge.dao.StudentDAO;
import com.junrenge.model.Student;

public class StudentImpl extends DAO<Student>{
	
	public static void main(String[] args) {
		StudentImpl si = new StudentImpl();
		List<Student> list = si.getAll();
		System.out.println(list.get(0).getSname());
		Student s= si.get(1);
		System.out.println(s.getSname());
		s.setSname("小明");
		si.update(s);
		Student s2 = new Student();
		s2.setSname("小王");
		si.save(s2);
	}
	
	public Student getOne(String sql){
		return get(sql, null);
	}
	
	@Override
	public <Student> List<Student> getAll() {
		String sql = "select * from student";
		return (List<Student>) getForList(sql, null);
	}

	@Override
	public void save(Student c) {
		String sql = "insert into student (sage,sbirth,sclass,sdept,sdorm,sgrade,sid,sjiguan,sname,sno,sphone,spw,ssex,sstartyear,sstudymodel) "
				+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		update(sql, c.getSage(), c.getSbirth(), c.getSclass(),
				c.getSdept(), c.getSdorm(), c.getSgrade(), c.getSid(),
				c.getSjiguan(), c.getSname(), c.getSno(), c.getSphone(),
				c.getSpw(), c.getSsex(), c.getSstartyear(), c.getSstudymodel());
	}

	@Override
	public void update(Student c) {
		String sql = "update student set sage=?,sbirth=?,sclass=?,sdept=?,sdorm=?,sgrade=?,sid=?,sjiguan=?,sname=?,sno=?,sphone=?,spw=?,ssex=?,sstartyear=?,sstudymodel=?"
				+ " where id=?";
		update(sql,c.getSage(), c.getSbirth(), c.getSclass(),
				c.getSdept(), c.getSdorm(), c.getSgrade(), c.getSid(),
				c.getSjiguan(), c.getSname(), c.getSno(), c.getSphone(),
				c.getSpw(), c.getSsex(), c.getSstartyear(), c.getSstudymodel(),c.getId());
		
	}

	@Override
	public Student get(Integer id) {
		String sql = "select * from student where sno =?";
		return get(sql,id);
	}

	@Override
	public void delete(Integer id) {
		String sql = "delete from student where id = ?";
		update(sql,id);
	}

}
