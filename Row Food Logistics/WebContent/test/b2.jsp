<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tt.util.JDBCTools"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<head>
</head>
<body>
<table>
<tr><th> ÊéÃû </th></tr>
<%
		JDBCTools jt = new JDBCTools();	
		Connection con = jt.getConnection();
		Statement stm = con.createStatement();
		ResultSet rs = null;
		
		String sql = "select * from book";
		rs = stm.executeQuery(sql);
		while(rs.next()!=false){
			%>
				<tr><td> <%=rs.getString("title") %> </td></tr>
			<%
		}

%>
</table>
</body>
</html>