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
		String cname = request.getParameter("cname");
		String sql = "select * from client";
		if(!cname.equals(null) && !"".equals(cname)){
			sql += " where client_name like '%"+cname+"%'";			
		}
		System.out.print(sql);
			ResultSet rs = jt.search(sql);
			ArrayList clients = new ArrayList();
			while(rs.next()!=false){
				Client c = new Client(rs.getInt("id"),rs.getString("enterprise_name"),rs.getString("type"),rs.getString("client_name"),rs.getString("password")
						,rs.getString("phone"),rs.getString("email"),rs.getString("address"),rs.getString("cnumber"));
				clients.add(c);
			}
			request.setAttribute("clients", clients);
			request.getRequestDispatcher("../manager_client.jsp").forward(request, response);
%>