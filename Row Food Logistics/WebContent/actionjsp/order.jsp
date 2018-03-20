<%@page import="com.tt.model.Line"%>
<%@page import="com.tt.model.Goods"%>
<%@page import="com.tt.model.Order"%>
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
		else if(m.equals("receive")){
			String id = request.getParameter("id");
			sql = "update rfl.`order` set receive = 1 where id = "+id;
			jt.update(sql);
			request.getRequestDispatcher("/actionjsp/order.jsp?method=confirm&enterprise1=&name1=").forward(request, response);
		}
		else if(m.equals("status")){
			String id = request.getParameter("id");
			sql = "update rfl.`order` set status = 1 where id = "+id;
			jt.update(sql);
			request.getRequestDispatcher("/actionjsp/order.jsp?method=mgshow&enterprise1=&name1=").forward(request, response);
		}
		else if(m.equals("review")){
			String id = request.getParameter("id");
			sql = "select * from rfl.`order` where id = "+id;
			ResultSet rs = jt.search(sql);
			Order o = null;
			if(rs.next()!=false){
				o = new Order(rs.getInt("id"),rs.getString("enterprise1"),rs.getString("name1"),rs.getString("phone1"),rs.getString("email1")
						,rs.getString("address1"),rs.getString("name2"),rs.getString("phone2"),rs.getString("email2"),rs.getString("address2"),rs.getString("goods_name")
						,rs.getString("goods_weight"),rs.getString("goods_tem"),rs.getString("goods_time"),rs.getString("line"),rs.getString("review"),rs.getString("plan"),rs.getString("status")
						,rs.getString("finish"),rs.getString("receive"),rs.getString("carid"),rs.getString("carname"));
			}
			//比较是否通过
			String line = o.getLine();
			String time = o.getGoods_time();
			String tons = o.getGoods_weight();
			String d = o.getGoods_tem();
			sql = "select car.* from line,car where line.type = car.type and line.time <= '"+time+"' and line.lines = '"+line+"' and car.remain != '0'" 
					+" and car.tons >= '"+tons+"' and device = '"+d+"' order by type asc,tons asc";
			rs = jt.search(sql);
			if(rs.next() != false){
				sql = "update rfl.`order` set carid = '"+rs.getInt("id")+"', carname = '"+rs.getString("idname")+"' where id = "+id;
				jt.update(sql);
				sql = "update car set remain = '"+(Integer.parseInt(rs.getString("remain"))-1)+"' where id = "+rs.getInt("id");
				jt.update(sql);
				sql = "update rfl.`order` set review = '1' where id = "+id;
				jt.update(sql);
			}else{
				sql = "update rfl.`order` set review = '2' where id = "+id;
				jt.update(sql);		
			}
			request.getRequestDispatcher("/actionjsp/order.jsp?method=mrshow&enterprise1=&name1=").forward(request, response);
		}
		else if(m.equals("finish")){
			String id = request.getParameter("id");
			sql = "update rfl.`order` set finish = 1 where id = "+id;
			jt.update(sql);
			request.getRequestDispatcher("/actionjsp/order.jsp?method=mcshow&enterprise1=&name1=").forward(request, response);
		}
		else if(m.equals("plan")){
			String id = request.getParameter("id");
			sql = "update rfl.`order` set plan = 1 where id = "+id;
			jt.update(sql);
			request.getRequestDispatcher("/actionjsp/order.jsp?method=mcreshow&enterprise1=&name1=").forward(request, response);
		}
		else if(m.equals("add")){
			sql = "select * from goods";
			ResultSet rs = jt.search(sql);
			ArrayList goods = new ArrayList();
			while(rs.next() != false){
				Goods g = new Goods(rs.getInt("id"),rs.getString("name"),rs.getString("tem"),rs.getString("humidity"));
				goods.add(g);
			}
			request.setAttribute("goods", goods);
			
			sql = "select * from line";
			rs = jt.search(sql);
			ArrayList lines = new ArrayList();
			while(rs.next() != false){
				Line l = new Line(rs.getInt("id"),rs.getString("idname"),rs.getString("lines"),rs.getString("type"),rs.getString("time"));
				lines.add(l);
			}
			request.setAttribute("lines", lines);	
			request.getRequestDispatcher("../client_order_create.jsp").forward(request, response);
			
		}
		else if(m.equals("update")){
			//得到用户id，得到用户信息
			Client c = null;
			String cid = request.getParameter("cid");
			if(!"".equals(cid) ){
				sql = "select * from client where id = "+cid;
				ResultSet rs = jt.search(sql);
				if(rs.next() != false){
					c = new Client(rs.getInt("id"),rs.getString("enterprise_name"),rs.getString("type"),rs.getString("client_name"),rs.getString("password")
							,rs.getString("phone"),rs.getString("email"),rs.getString("address"),rs.getString("cnumber"));
				}
			}
			
			
			String id = request.getParameter("id");
			/* String  s1 = request.getParameter("enterprise1");
			String  s2 = request.getParameter("name1");
			String  s3 = request.getParameter("phone1");
			String  s4 = request.getParameter("email1");
			String  s5 = request.getParameter("address1"); */
			String  s1 = c.getEnterprise_name();
			String  s2 = c.getClient_name();
			String  s3 = c.getPhone();
			String  s4 = c.getEmail();
			String  s5 = c.getAddress();
			String  s6 = request.getParameter("name2");
			String  s7 = request.getParameter("phone2");
			String  s8 = request.getParameter("email2");
			String  s9 = request.getParameter("address2");
			String  s10 = request.getParameter("goods_name");
			String  s11 = request.getParameter("goods_weight");
			String  s12 = request.getParameter("goods_tem");
			String  s13 = request.getParameter("goods_time");
			String  s14 = request.getParameter("line");
			
			if(!"".equals(id) && !id.equals(null)){
			}else{
				sql = "insert into rfl.`order` (enterprise1, name1, phone1," 
						+"email1, address1, name2,phone2,email2,address2,goods_name,goods_weight,goods_tem,goods_time,line)" 
						+" values ('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s7+"','"+s8+"','"+s9+"','"+s10+"','"+s11+"','"+s12+"','"+s13+"','"+s14+"')";
			}
			System.out.println(sql);
			jt.update(sql);
			request.getRequestDispatcher("/actionjsp/order.jsp?method=show&enterprise1=&name1=").forward(request, response);
		}
		else{
			String enterprise1 = request.getParameter("enterprise1");
			String name1 = "";
			if(m.equals("show") || m.equals("confirm")){
				name1 = (String)session.getAttribute("cname");
			}else{
				name1 = request.getParameter("name1");
			}
			//用户登录成功，在session里面会存放name，用来比较order表中的name1字段
			sql = "select * from rfl.`order` where enterprise1 like '%"+enterprise1+"%' and name1 like '%"+name1+"%'";
			System.out.println(sql);
			ResultSet rs = jt.search(sql);
			ArrayList os = new ArrayList();
			while(rs.next()!=false){
				Order o = new Order(rs.getInt("id"),rs.getString("enterprise1"),rs.getString("name1"),rs.getString("phone1"),rs.getString("email1")
						,rs.getString("address1"),rs.getString("name2"),rs.getString("phone2"),rs.getString("email2"),rs.getString("address2"),rs.getString("goods_name")
						,rs.getString("goods_weight"),rs.getString("goods_tem"),rs.getString("goods_time"),rs.getString("line"),rs.getString("review"),rs.getString("plan"),rs.getString("status")
						,rs.getString("finish"),rs.getString("receive"),rs.getString("carid"),rs.getString("carname"));
					os.add(o);
			}
			request.setAttribute("os", os);
			String direct = request.getParameter("method");
			System.out.println(direct);
			if(direct.equals("show")){
				request.getRequestDispatcher("../client_order_show.jsp").forward(request, response);
			}
			else if(direct.equals("mgshow")){
				request.getRequestDispatcher("../manager_order_goods.jsp").forward(request, response);
			}
			else if(direct.equals("mcreshow")){
				request.getRequestDispatcher("../manager_order_create.jsp").forward(request, response);
			}
			else if(direct.equals("mcshow")){
				request.getRequestDispatcher("../manager_order_confirm.jsp").forward(request, response);
			}
			else if(direct.equals("mrshow")){
				request.getRequestDispatcher("../manager_order_review.jsp").forward(request, response);
			}
			else if(direct.equals("mshow")){
				request.getRequestDispatcher("../manager_order_show.jsp").forward(request, response);
			}
			else{
				request.getRequestDispatcher("../client_order_confirm.jsp").forward(request, response);
			}
		}
%>