package com.junrenge.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.junrenge.dao.DAO;
import com.junrenge.db.JdbcUtils;
import com.xuyixin.model.Fahp;

public class FahpImpl extends DAO<Fahp>{
	String sql = "";
	//�õ�fahp���е���������
	@Override
	public <Fahp> List<Fahp> getAll() {
		sql = "select * from fahp";
		return (List<Fahp>) getForList(sql, null);
	}
	//��fahp���в���һ���µ�Ԫ��
	@Override
	public void save(Fahp c) {
		sql = "insert into fahp (id, riskids, factorids, evaid, judgem, weights, evam, evavectors, result,arr,type) values(?,?,?,?,?,?,?,?,?,?,?)";
		update(sql, c.getId(),c.getRiskids(),c.getFactorids(),c.getEvaid(),c.getJudgem(), c.getWeights(),
				c.getEvam(),c.getEvavectors(), c.getResult(), c.getArr(),c.getType());
	}
	//����id����fahp���и���һ��Ԫ��������ֶ�
	@Override
	public void update(Fahp c) {
		sql = "update fahp set riskids=?, factorids=?, evaid=?, judgem=?, weights=?, evam=?, evavectors=?,result=?, arr=?, type=? where id = ?";
		update(sql, c.getRiskids(),c.getFactorids(),c.getEvaid(),c.getJudgem(), c.getWeights(),
				c.getEvam(),c.getEvavectors(), c.getResult(), c.getArr(), c.getType(), c.getId());
	}
	//����id�õ�fahp���е�һ��Ԫ��
	@Override
	public Fahp get(Integer id) {
		sql = "select * from fahp where id =?";
		return get(sql, id);
	}
	//����idɾ��fahp���е�һ��Ԫ��
	@Override
	public void delete(Integer id) {
		sql = "delete from fahp where id = ?";
		update(sql, id);
	}
	
	public int getFahpid() {
		int id = 0;
		try {
			java.sql.Connection c = JdbcUtils.getConnection();
			Statement statement = null;
			ResultSet rs = null;;
			statement = c.createStatement();
			rs = statement.executeQuery("select max(id) from fahp");
			if(rs.next() != false) id = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}

}
