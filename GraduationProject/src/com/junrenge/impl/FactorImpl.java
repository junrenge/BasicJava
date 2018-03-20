package com.junrenge.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.junrenge.dao.DAO;
import com.junrenge.db.JdbcUtils;
import com.xuyixin.model.Factor;
import com.xuyixin.model.RiskFactor;

public class FactorImpl extends DAO<Factor>{
	
	String sql = "";
	@Override
	public <Factor> List<Factor> getAll() {
		sql = "select * from factor";
		return (List<Factor>) getForList(sql, null);
	}

	@Override
	public void delete(Integer id) {
		sql = "delete from factor where id = ?";
		update(sql, id);
	}

	@Override
	public void save(Factor c) {
		sql = "insert into factor (id, fname, rid) values (?, ?, ?)";
		update(sql, c.getId(),c.getFname(),c.getRid());
	}

	@Override
	public void update(Factor c) {
		sql = "update factor set fname=?, rid=? where id = ?";
		update(sql,c.getFname(), c.getRid(), c.getId());
	}

	@Override
	public Factor get(Integer id) {
		sql = "select * from factor where id = ?";
		return get(sql,id);
	}
	
	public List<Factor> get(Integer [] ids) {
		List<Factor> list = new LinkedList<Factor>();
		for (int i = 0; i < ids.length; i++) {
			sql = "select * from factor where id = ?";
			list.add(get(sql,ids[i]));
		}
		return list;
	}
	
	public List<RiskFactor> getRF(){
		List<RiskFactor> list = new LinkedList<RiskFactor>();
		sql = "select * from risk left join factor on risk.id = factor.rid";
		try {
			java.sql.Connection c = JdbcUtils.getConnection();
			Statement statement = null;
			ResultSet rs = null;
			statement = c.createStatement();
			rs = statement.executeQuery(sql);
			while(rs.next() != false){
				RiskFactor rf = new RiskFactor();
				rf.setRname(rs.getString(2));
				rf.setFnum(rs.getInt(3)+"");
				//可能报空
				rf.setFname(rs.getString(5));
				rf.setFid(rs.getInt(4)+"");
				//System.out.println(rs.getString(2)+rs.getInt(3)+rs.getString(5)+rs.getInt(4));
				list.add(rf);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<RiskFactor> getRF(Integer [] ids){
		List<RiskFactor> list = new LinkedList<RiskFactor>();
		try {
			java.sql.Connection c = JdbcUtils.getConnection();
			Statement statement = null;
			ResultSet rs = null;
			statement = c.createStatement();
			Map m = new HashMap<>();
			for (int i = 0; i < ids.length; i++) {
				sql = "select * from risk left join factor on risk.id = factor.rid "
						+ "where factor.id = "+ids[i];
				
			rs = statement.executeQuery(sql);
			while(rs.next() != false){
				m.put(""+rs.getInt(1), rs.getInt(1));
				RiskFactor rf = new RiskFactor();
				rf.setRname(rs.getString(2));
				rf.setFnum(rs.getInt(3)+"");
				//可能报空
				rf.setFname(rs.getString(5));
				rf.setFid(rs.getInt(4)+"");
				//System.out.println(rs.getString(2)+rs.getInt(3)+rs.getString(5)+rs.getInt(4));
				list.add(rf);
			}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public String getRids(Integer [] ids){
		String str = "";
		Map m = new HashMap<>();
		try {
			java.sql.Connection c = JdbcUtils.getConnection();
			Statement statement = null;
			ResultSet rs = null;
			statement = c.createStatement();
			for (int i = 0; i < ids.length; i++) {
				sql = "select * from risk left join factor on risk.id = factor.rid "
						+ "where factor.id = "+ids[i];
				rs = statement.executeQuery(sql);
				while(rs.next() != false){
					m.put(""+rs.getInt(1), rs.getInt(1));
				}
			}
			for(Object obj : m.keySet()){
				str  = str + m.get(obj) + ",";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return str;
	}


}
