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
	//得到fahp表中的所有数据
	@Override
	public <Fahp> List<Fahp> getAll() {
		sql = "select * from fahp";
		return (List<Fahp>) getForList(sql, null);
	}
	//向fahp表中插入一条新的元组
	@Override
	public void save(Fahp c) {
		sql = "insert into fahp (id, riskids, factorids, evaid, judgem, weights, evam, evavectors, result,arr,type) values(?,?,?,?,?,?,?,?,?,?,?)";
		update(sql, c.getId(),c.getRiskids(),c.getFactorids(),c.getEvaid(),c.getJudgem(), c.getWeights(),
				c.getEvam(),c.getEvavectors(), c.getResult(), c.getArr(),c.getType());
	}
	//根据id，在fahp表中更新一条元组的若干字段
	@Override
	public void update(Fahp c) {
		sql = "update fahp set riskids=?, factorids=?, evaid=?, judgem=?, weights=?, evam=?, evavectors=?,result=?, arr=?, type=? where id = ?";
		update(sql, c.getRiskids(),c.getFactorids(),c.getEvaid(),c.getJudgem(), c.getWeights(),
				c.getEvam(),c.getEvavectors(), c.getResult(), c.getArr(), c.getType(), c.getId());
	}
	//根据id得到fahp表中的一条元组
	@Override
	public Fahp get(Integer id) {
		sql = "select * from fahp where id =?";
		return get(sql, id);
	}
	//根据id删除fahp表中的一条元组
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
