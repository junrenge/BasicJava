<%@page import="com.tt.model.Line"%>
<%@page import="com.tt.model.Goods"%>
<%@page import="com.tt.model.Car"%>
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
		String sql = "";
		//获取method的值，判断操作类型
		String m = request.getParameter("method");
		if(m.equals("edit")){
			String id = request.getParameter("id");
			if(!"".equals(id) && !id.equals(null)){
				sql = "select * from client where id = "+id;
				ResultSet rs = jt.search(sql);
				if(rs.next() != false){
					Client c = new Client(rs.getInt("id"),rs.getString("enterprise_name"),rs.getString("type"),rs.getString("client_name"),rs.getString("password")
							,rs.getString("phone"),rs.getString("email"),rs.getString("address"),rs.getString("cnumber"));
					request.setAttribute("client", c);
				}
			}
			request.getRequestDispatcher("../client_information_edit.jsp").forward(request, response);
			
		}else if(m.equals("update")){
			String id = request.getParameter("id");
			String  s1 = request.getParameter("ename");
			String  s2 = request.getParameter("type");
			String  s3 = request.getParameter("cname");
			String  s4 = request.getParameter("password");
			String  s5 = request.getParameter("phone");
			String  s6 = request.getParameter("email");
			String  s7 = request.getParameter("address");
			String  s8 = request.getParameter("cnumber");
			
			if(!"".equals(id) && !id.equals(null)){
				sql = "update client set enterprise_name='"+s1+"', type='"+s2+"', client_name='"+s3+"',password='"+s4+"',phone='"+s5+
						"',email='"+s6+"',address='"+s7+"',cnumber='"+s8+"' where id = "+id; 
				jt.update(sql);
				request.getRequestDispatcher("/actionjsp/c_info.jsp?method=show&id="+id).forward(request, response);
			}else{
				sql = "insert into client (enterprise_name, type, client_name, password,phone,email,address,cnumber) " 
					+"values ('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s7+"','"+s8+"')";
				jt.update(sql);
				response.sendRedirect("/Row_Food_Logistics/client_login.jsp");
			}
		}else if(m.equals("show")){
			String id = request.getParameter("id");
			if(!"".equals(id) && !id.equals(null)){
				sql = "select * from client where id = "+id;
				ResultSet rs = jt.search(sql);
				if(rs.next() != false){
					Client c = new Client(rs.getInt("id"),rs.getString("enterprise_name"),rs.getString("type"),rs.getString("client_name"),rs.getString("password")
							,rs.getString("phone"),rs.getString("email"),rs.getString("address"),rs.getString("cnumber"));
					request.setAttribute("client", c);
				}
			}
			request.getRequestDispatcher("../client_information.jsp").forward(request, response);
			
		}
%>