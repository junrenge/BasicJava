package com.junrenge.impl;

import java.util.List;

import com.junrenge.dao.DAO;
import com.xuyixin.model.Eva;
import com.xuyixin.model.Risk;

public class EvaImpl extends DAO<Eva>{
	
	String sql = "";
	@Override
	public <Eva> List<Eva> getAll() {
		sql = "select * from eva";
		return (List<Eva>) getForList(sql, null);
	}

	@Override
	public void save(Eva c) {
		sql = "insert into eva (id, names, credits, num) values(?,?,?,?)";
		update(sql, c.getId(),c.getNames(),c.getCredits(),c.getNum());
	}

	@Override
	public void update(Eva c) {
		sql = "update eva set names = ?, credits = ?, num = ? where id = ?";
		update(sql, c.getNames(),c.getCredits(),c.getNum(),c.getId());
	}

	@Override
	public Eva get(Integer id) {
		sql = "select * from eva where id =?";
		return get(sql, id);
	}

	@Override
	public void delete(Integer id) {
		sql = "delete from eva where id = ?";
		update(sql, id);
	}

}
