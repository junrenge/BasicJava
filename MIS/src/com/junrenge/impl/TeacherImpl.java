package com.junrenge.impl;

import java.util.List;

import com.junrenge.dao.DAO;
import com.junrenge.model.Student;
import com.junrenge.model.Teacher;

public class TeacherImpl extends DAO<Teacher>{

	public Teacher getOne(String sql){
		return get(sql, null);
	}
	
	@Override
	public <Teacher> List<Teacher> getAll() {
		String sql = "select * from teacher";
		return (List<Teacher>) getForList(sql, null);
	}

	@Override
	public void save(Teacher c) {
		String sql = "insert into teacher (tno,tname,tage,tsex,tpw,cno) values (?,?,?,?,?,?)";
		update(sql, c.getTno(),c.getTname(),c.getTage(),c.getTsex(),c.getTpw());
	}

	@Override
	public void update(Teacher c) {
		String sql = "update teacher set tno=?,tname=?,tage=?,tsex=?,tpw=?,cno=? where id=?";
		update(sql, c.getTno(),c.getTname(),c.getTage(),c.getTsex(),c.getTpw(),c.getCno(),c.getId());
	}

	@Override
	public Teacher get(Integer id) {
		String sql = "select * from teacher where id=?";
		return get(sql, id);
	}

	@Override
	public void delete(Integer id) {
		String sql = "delete from teacher where id=?";
		update(sql,id);
	}

}
