package com.junrenge.dao;

import java.util.List;

import com.junrenge.model.Student;

public interface StudentDAO {
	
	//����ȫ��ѧ��
	public <Student> List<Student> getAll();
	//����һ����ѧ��
	public void save(Student c);
	//����һ��ѧ������Ϣ
	public void update(Student c);
	//�õ�һ�������ѧ����ͨ��id
	public Student get(Integer id);
	//ɾ��һ��ѧ��
	public void delete(Integer id);

}
