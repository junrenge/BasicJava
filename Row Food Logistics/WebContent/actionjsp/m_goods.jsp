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
		if(m.equals("delete")){
			String id = request.getParameter("id");
			sql = "delete from goods where id = "+id;
			jt.update(sql);
			request.getRequestDispatcher("/actionjsp/m_goods.jsp?method=").forward(request, response);
		}
		else if(m.equals("edit")){
			String id = request.getParameter("id");
			if(!"".equals(id) && !id.equals(null)){
				sql = "select * from goods where id = "+id;
				ResultSet rs = jt.search(sql);
				if(rs.next() != false){
					Goods g = new Goods(rs.getInt("id"),rs.getString("name"),rs.getString("tem"),rs.getString("humidity"));
					request.setAttribute("goods", g);
				}
			}
			request.getRequestDispatcher("../manager_goods_edit.jsp").forward(request, response);
			
		}else if(m.equals("update")){
			String id = request.getParameter("id");
			String  s1 = request.getParameter("name");
			String  s2 = request.getParameter("tem");
			String  s3 = request.getParameter("humidity");
			
			if(!"".equals(id) && !id.equals(null)){
				sql = "update goods set name='"+s1+"', tem='"+s2+"', humidity='"+s3+"' where id = "+id; 
			}else{
				sql = "insert into goods (name, tem, humidity) " 
					+"values ('"+s1+"','"+s2+"','"+s3+"')";
			}
			jt.update(sql);
			request.getRequestDispatcher("/actionjsp/m_goods.jsp?method=").forward(request, response);
		}
		else{
		sql = "select * from goods";
			ResultSet rs = jt.search(sql);
			ArrayList goods = new ArrayList();
			while(rs.next()!=false){
				Goods g = new Goods(rs.getInt("id"),rs.getString("name"),rs.getString("tem"),rs.getString("humidity"));
				goods.add(g);
			}
			request.setAttribute("goods", goods);
			request.getRequestDispatcher("../manager_goods.jsp").forward(request, response);
		}
%>