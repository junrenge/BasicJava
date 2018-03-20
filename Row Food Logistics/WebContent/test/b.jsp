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
		ResultSet rs = jt.search("select * from book");
		while(rs.next()!=false){
			%>
				<tr><td> <%=rs.getString("title") %> </td></tr>
			<%
		}
		request.getRequestDispatcher("a.jsp").forward(request, response);

%>
</table>
</body>
</html>