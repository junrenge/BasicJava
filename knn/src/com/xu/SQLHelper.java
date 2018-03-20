package com.bxd;

import java.io.*;

import java.sql.*;
import java.util.*;

public class SQLHelper {
	private static Connection ct=null;
	private static PreparedStatement ps=null;
	private static ResultSet rs=null;
	
	private static String driver;
	private static String url;
	private static String userName;
	private static String password;
	
	private static FileInputStream fis=null;
	private static Properties ppt=null;
	static{
		try {
			fis = new FileInputStream("SQLInfo.properties");
			ppt = new Properties();
			ppt.load(fis);
			driver = ppt.getProperty("driver");
			url = ppt.getProperty("url");
			userName = ppt.getProperty("userName");
			password = ppt.getProperty("password");
			
		} catch (IOException eIO){
			eIO.printStackTrace();
		}
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException eDB){
			eDB.printStackTrace();
		}
	}
	
	public static Connection getCt() {
		return ct;
	}

	public static PreparedStatement getPs() {
		return ps;
	}

	public static ResultSet getSQLQuery(String SQL,String[] parameters){
		try {
			ct = DriverManager.getConnection(url,userName,password);
			ps = ct.prepareStatement(SQL);
			if(parameters!=null)
				for(int i=0;i<parameters.length;i++)
					ps.setString(i+1, parameters[i]);
			rs = ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	public static int errorcount=0;
	public static void ExecuteSQL(String SQL,String[] parameters){
		try {
			ct = DriverManager.getConnection(url,userName,password);
			ps = ct.prepareStatement(SQL);
			if(parameters!=null)
				for(int i=0;i<parameters.length;i++)
					ps.setString(i+1, parameters[i]);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			errorcount++;
			System.out.println(errorcount);
		}
	}
	
	public static void closeDB(ResultSet rs,PreparedStatement ppt,Connection ct){
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				rs=null;
			}
		}
		if(ppt!=null){
			try {
				ppt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				ppt=null;
			}
		}
		if(ct!=null){
			try {
				ct.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				ct=null;
			}
		}
	}
}
