package com.junrenge.impl;

import java.util.List;


import com.junrenge.dao.DAO;
import com.junrenge.dao.StudentDAO;
import com.junrenge.model.Student;
import com.junrenge.model.Class;

public class ClassImpl extends DAO<Class>{
	
	public static void main(String[] args) {
		ClassImpl ci = new ClassImpl();
		Class c = ci.get(1);
		System.out.println(c.getCclass());
	}
	
	public Class getOne(String sql){
		return get(sql, null);
	}
	
	@Override
	public <Class> List<Class> getAll() {
		String sql = "select * from class";
		return (List<Class>) getForList(sql, null);
	}

	@Override
	public void save(Class c) {
		String sql = "insert into class (cno,cname,cgrade,ctime,cplace,ccredit,ctype,cweekday,ctag,cclass,cterm) "
				+ "values (?,?,?,?,?,?,?,?,?,?,?)";
		update(sql, c.getCno(), c.getCname(), c.getCgrade(),
				c.getCtime(), c.getCplace(), c.getCcredit(), c.getCtype(),
				c.getCweekday(), c.getCtag(), c.getCclass(), c.getCterm());
	}

	@Override
	public void update(Class c) {
		String sql = "update class set cno=?,cname=?,cgrade=?,ctime=?,cplace=?,ccredit=?,ctype=?,cweekday=?,ctag=?,cclass=?,cterm=?"
				+ " where id=?";
		update(sql,c.getCno(), c.getCname(), c.getCgrade(),
				c.getCtime(), c.getCplace(), c.getCcredit(), c.getCtype(),
				c.getCweekday(), c.getCtag(), c.getCclass(), c.getCterm(),c.getId());
		
	}

	@Override
	public Class get(Integer id) {
		String sql = "select * from class where id =?";
		return get(sql,id);
	}
	
	public Class get(String cno) {
		String sql = "select * from class where cno =?";
		return get(sql,cno);
	}

	@Override
	public void delete(Integer id) {
		String sql = "delete from class where id = ?";
		update(sql,id);
	}

}
