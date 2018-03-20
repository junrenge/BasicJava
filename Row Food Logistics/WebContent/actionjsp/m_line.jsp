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
		if(m.equals("delete")){
			String id = request.getParameter("id");
			sql = "delete from line where id = "+id;
			jt.update(sql);
			request.getRequestDispatcher("/actionjsp/m_line.jsp?method=").forward(request, response);
		}
		else if(m.equals("edit")){
			String id = request.getParameter("id");
			if(!"".equals(id) && !id.equals(null)){
				sql = "select * from line where id = "+id;
				ResultSet rs = jt.search(sql);
				if(rs.next() != false){
					Line l = new Line(rs.getInt("id"),rs.getString("idname"),rs.getString("lines"),rs.getString("type"),rs.getString("time"));
					request.setAttribute("line", l);
				}
			}
			request.getRequestDispatcher("../manager_line_edit.jsp").forward(request, response);
			
		}else if(m.equals("update")){
			String id = request.getParameter("id");
			String  s1 = request.getParameter("idname");
			String  s2 = request.getParameter("lines");
			String  s3 = request.getParameter("type");
			String  s4 = request.getParameter("time");
			
			if(!"".equals(id) && !id.equals(null)){
				sql = "update line set idname='"+s1+"', line.lines='"+s2+"', type='"+s3+"',time='"+s4+"' where id = "+id; 
			}else{
				sql = "insert into line (idname, line.lines, type,time) " 
					+"values ('"+s1+"','"+s2+"','"+s3+"','"+s4+"')";
			}
			System.out.print(sql);
			jt.update(sql);
			request.getRequestDispatcher("/actionjsp/m_line.jsp?method=").forward(request, response);
		}
		else{
		sql = "select * from line";
			ResultSet rs = jt.search(sql);
			ArrayList goods = new ArrayList();
			while(rs.next()!=false){
				Line l = new Line(rs.getInt("id"),rs.getString("idname"),rs.getString("lines"),rs.getString("type"),rs.getString("time"));
				goods.add(l);
			}
			request.setAttribute("lines", goods);
			request.getRequestDispatcher("../manager_lines.jsp").forward(request, response);
		}
%>