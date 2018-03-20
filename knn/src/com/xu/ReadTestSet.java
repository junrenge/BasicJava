package com.bxd;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReadTestSet {

	public List<OneData> DataTest() throws IOException {
		List<OneData> testsetlist = new ArrayList();
		String sql = "select * from testset";
		ResultSet rrs = SQLHelper.getSQLQuery(sql, null);
		int count = 0;
		try {
			while(rrs.next()){
				OneData data=new OneData();
		        data.setRs(rrs.getString("rs"));
		        data.setType(rrs.getInt("type"));
		        testsetlist.add(data);
//				System.out.println(rrs.getString("rs"));
//				System.out.println(rrs.getInt("type"));
				count++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("从数据库的testset表中读取了"+count+"条记录。");
		return testsetlist;
	}
}
