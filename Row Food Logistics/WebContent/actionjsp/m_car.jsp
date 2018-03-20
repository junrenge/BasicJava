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
			sql = "delete from car where id = "+id;
			jt.update(sql);
			request.getRequestDispatcher("/actionjsp/m_car.jsp?method=&carname=&type=").forward(request, response);
		}
		else if(m.equals("edit")){
			String id = request.getParameter("id");
			if(!"".equals(id) && !id.equals(null)){
				sql = "select * from car where id = "+id;
				ResultSet rs = jt.search(sql);
				if(rs.next() != false){
					Car c = new Car(rs.getInt("id"), rs.getString("idname"), rs.getString("type"), rs.getString("device")
							, rs.getString("tons"), rs.getString("remain"), rs.getString("standard"));
					request.setAttribute("car", c);
				}
			}
			request.getRequestDispatcher("../manager_cars_edit.jsp").forward(request, response);
			
		}else if(m.equals("update")){
			String id = request.getParameter("id");
			String  s1 = request.getParameter("idname");
			String  s2 = request.getParameter("type");
			String  s3 = request.getParameter("device");
			String  s4 = request.getParameter("tons");
			String  s5 = request.getParameter("remain");
			String  s6 = request.getParameter("standard");
			
			if(!"".equals(id) && !id.equals(null)){
				sql = "update car set idname='"+s1+"', type='"+s2+"', device='"+s3+"', tons='"+s4+"', remain='"+s5+"', standard='"+s6+"'"
						+" where id = "+id; 
			}else{
				sql = "insert into car (idname, type, device, tons, remain, standard) " 
					+"values ('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"')";
			}
			jt.update(sql);
			request.getRequestDispatcher("/actionjsp/m_car.jsp?method=&carname=&type=").forward(request, response);
		}
		else{
		String cname = request.getParameter("carname");
		String type = request.getParameter("type");
		sql = "select * from car where idname like '%"+cname+"%' and type like '%"+type+"%'";
		System.out.print(sql);
			ResultSet rs = jt.search(sql);
			ArrayList cars = new ArrayList();
			while(rs.next()!=false){
				Car c = new Car(rs.getInt("id"), rs.getString("idname"), rs.getString("type"), rs.getString("device")
						, rs.getString("tons"), rs.getString("remain"), rs.getString("standard"));
				cars.add(c);
			}
			request.setAttribute("cars", cars);
			request.getRequestDispatcher("../manager_cars.jsp").forward(request, response);
		}
%>