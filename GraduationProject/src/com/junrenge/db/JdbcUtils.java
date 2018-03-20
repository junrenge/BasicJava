package com.junrenge.db;

import java.sql.SQLException;



import javax.activation.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.mysql.jdbc.Connection;

public class JdbcUtils {
	
	private static ComboPooledDataSource dataSource=null;
	static{
		dataSource = new ComboPooledDataSource("stapp");
	}
	
	/**
	 * �ͷ�һ��Connection����
	 */
	public static void releaseConnection(java.sql.Connection connection){
		try {
			if(connection != null){
				connection.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void releaseConnection(java.sql.Connection connection,java.sql.Statement st){
		try {
			if(connection != null){
				connection.close();
			}
			if(st != null){
				st.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * ����һ��Connection����
	 */
	public static java.sql.Connection getConnection() throws SQLException{
		return dataSource.getConnection();
	}
}
