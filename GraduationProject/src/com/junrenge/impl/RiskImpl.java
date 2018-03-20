package com.junrenge.impl;

import java.util.LinkedList;
import java.util.List;

import com.junrenge.dao.DAO;
import com.xuyixin.model.Factor;
import com.xuyixin.model.Risk;

public class RiskImpl extends DAO<Risk>{
	
	public static void main(String[] args) {
		RiskImpl ri = new RiskImpl();
		Risk r = new Risk();
//		r.setName("内部风险");
//		ri.save(r);
		
		r = ri.get(1);
		r.setName("内部");
		ri.update(r);
		ri.delete(2);
		ri.delete(3);
		ri.delete(4);
	}

	String sql = "";
	@Override
	public <Risk> List<Risk> getAll() {
		sql = "select * from risk";
		return (List<Risk>) getForList(sql, null);
	}

	@Override
	public void save(Risk c) {
		sql = "insert into risk (id, name, factornum) values(?,?,?)";
		update(sql, c.getId(),c.getName(),c.getFactornum());
	}

	@Override
	public void update(Risk c) {
		sql = "update risk set name = ?, factornum = ? where id = ?";
		update(sql, c.getName(),c.getFactornum(),c.getId());
	}

	@Override
	public Risk get(Integer id) {
		sql = "select * from risk where id =?";
		return get(sql, id);
	}

	@Override
	public void delete(Integer id) {
		sql = "delete from risk where id = ?";
		update(sql, id);
	}
	
	public List<Risk> get(Integer [] ids) {
		List<Risk> list = new LinkedList<Risk>();
		for (int i = 0; i < ids.length; i++) {
			sql = "select * from risk where id = ?";
			list.add(get(sql,ids[i]));
		}
		return list;
	}

}
