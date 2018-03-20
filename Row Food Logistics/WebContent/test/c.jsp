<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tt.util.JDBCTools"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<head>
</head>
<body>
<%
		JDBCTools jt = new JDBCTools();	
		request.setCharacterEncoding("gb2312");
		String name = request.getParameter("username");
		String sql = "insert into abc (name) values ('"+name+"')";
		System.out.print(sql);
		jt.update(sql);
		out.print("ok");
%>
</body>
</html>