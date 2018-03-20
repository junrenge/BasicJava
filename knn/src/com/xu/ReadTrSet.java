package com.bxd;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReadTrSet {
	
	public List<OneData> DataTr() throws IOException {
		List<OneData> testsetlist = new ArrayList();
		String sql = "select * from trset";
		ResultSet rrs = SQLHelper.getSQLQuery(sql, null);
		int count = 0;
		try {
			while(rrs.next()){
				OneData data=new OneData();
		        data.setRs(rrs.getString("rs"));
		        data.setType(rrs.getInt("type"));
		        testsetlist.add(data);
				count++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("从数据库的trset表中读取了"+count+"条记录。");
		return testsetlist;
	}
}
