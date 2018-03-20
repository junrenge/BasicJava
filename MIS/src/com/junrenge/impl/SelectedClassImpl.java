package com.junrenge.impl;

import java.text.DecimalFormat;
import java.util.List;

import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.junrenge.dao.DAO;
import com.junrenge.db.JdbcUtils;
import com.junrenge.model.Class;
import com.junrenge.model.SelectedClass;
import com.mysql.jdbc.Statement;

public class SelectedClassImpl extends DAO<SelectedClass>{
	
	public static void main(String[] args) {
		SelectedClassImpl ci = new SelectedClassImpl();
	}
	
	public SelectedClass getOne(String sql){
		return get(sql, null);
	}
	
	@Override
	public <SelectedClass> List<SelectedClass> getAll() {
		String sql = "select * from selectedclass";
		return (List<SelectedClass>) getForList(sql, null);
	}

	@Override
	public void save(SelectedClass c) {
		String sql = "insert into selectedclass (cno,cname,sno,sname,tno,tname,grade) "
				+ "values (?,?,?,?,?,?,?)";
		update(sql, c.getCno(), c.getCname(), c.getSno(),c.getSname(),c.getTno(),c.getTname(),c.getGrade());
	}

	@Override
	public void update(SelectedClass c) {
		String sql = "update selectedclass set cno=?,cname=?,sno=?,sname=?,tno=?,tname=?,grade=?"
				+ " where id=?";
		update(sql,c.getCno(), c.getCname(), c.getSno(),c.getSname(),c.getTno(),c.getTname(),c.getGrade(),c.getId());
		
	}
	
	public void updateScs(String [] snos, String [] grades, String cno){
		java.sql.Connection conn = null;
		java.sql.PreparedStatement pst= null;
		try {
			String sql = "update selectedclass set grade = ?,credit = ?,jidian = ?,cj = ? where cno = ? and sno = ?";
			conn = JdbcUtils.getConnection();
			pst = conn.prepareStatement(sql);
			String tempsql = "select ccredit from class where cno = '"+cno+"'";
			ClassImpl ci = new ClassImpl();
			String credit = ci.getForValue(tempsql, null);
			DecimalFormat df = new DecimalFormat("#.00");  
			if(snos.length == grades.length){
				for (int i = 0; i < snos.length; i++) {
					pst.setString(1, grades[i]);
					String jidian = df.format((Double.parseDouble(grades[i])/10)-5);
					String cj = df.format(((Double.parseDouble(grades[i])/10)-5)*(Integer.parseInt(credit)));
					pst.setString(2, credit);
					pst.setString(3, jidian);
					pst.setString(4, cj);
					pst.setString(5, cno);
					pst.setString(6, snos[i]);
					pst.addBatch();
				}
				pst.executeBatch();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.releaseConnection(conn,pst);
		}
	}

	@Override
	public SelectedClass get(Integer id) {
		String sql = "select * from selectedclass where id =?";
		return get(sql,id);
	}

	@Override
	public void delete(Integer id) {
		String sql = "delete from selectedclass where id = ?";
		update(sql,id);
	}

}
