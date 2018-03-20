<%@page import="java.util.ArrayList"%>
<%@page import="com.tt.model.Book"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tt.util.JDBCTools"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%
		JDBCTools jt = new JDBCTools();	
		ResultSet rs = jt.search("select * from book");
		ArrayList books = new ArrayList();
		while(rs.next()!=false){
			Book b = new Book();
			b.setId(rs.getInt("id"));
			b.setTitle(rs.getString("title"));
			books.add(b);
		}
		request.setAttribute("tt", books);
		request.getRequestDispatcher("a.jsp").forward(request, response);

%>