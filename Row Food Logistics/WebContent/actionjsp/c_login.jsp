<%@page import="com.tt.model.Client"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tt.util.JDBCTools"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%
		request.setCharacterEncoding("gb2312");
		JDBCTools jt = new JDBCTools();	
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String sql = "select * from client where client_name = '"+name+"' and password = '"+password+"'";
		System.out.println(sql);
		ResultSet rs = jt.search(sql);
		if(rs.next()!=false){
			session.setAttribute("cname", rs.getString("client_name"));
			session.setAttribute("cid", rs.getInt("id"));
			request.getRequestDispatcher("../client_home.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("../client_login.jsp").forward(request, response);
		}
%>