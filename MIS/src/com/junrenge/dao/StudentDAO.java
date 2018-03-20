package com.junrenge.dao;

import java.util.List;

import com.junrenge.model.Student;

public interface StudentDAO {
	
	//查找全部学生
	public <Student> List<Student> getAll();
	//插入一个新学生
	public void save(Student c);
	//更新一个学生的信息
	public void update(Student c);
	//得到一个具体的学生，通过id
	public Student get(Integer id);
	//删除一个学生
	public void delete(Integer id);

}
