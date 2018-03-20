<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="src.com.yxq.valuebean.Book"%>
<%@ page import="src.com.yxq.toolbean.MyTools"%>
<%
	ArrayList goodslist = (ArrayList) session.getAttribute("goodslist");
	String action = request.getParameter("action");
	Connection con;
	Statement stm;
	String url = "jdbc:mysql://127.0.0.1/testjdbc?useUnicode=true&characterEncoding=UTF-8";
	String usr = "root";
	String pwd = "root";
	String sql = null;
	
	if (action == null)
		action = "";
	if (action.equals("edit")){ 
		int id = MyTools.strToint(request.getParameter("id"));
		for (int i = 0; i < goodslist.size(); i++) { 
			Book temp = (Book) goodslist.get(i); 
			if (temp.getId() == id) {
				request.setAttribute("book", temp);
				request.getRequestDispatcher("/edit.jsp").forward(request, response);
			}
		}
	}else if(action.equals("create")) {
		response.sendRedirect("edit.jsp");
	}else if (action.equals("delete")) {
		int id = MyTools.strToint(request.getParameter("id"));
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, usr, pwd);
			stm = con.createStatement();
			sql = "delete from book where id = "+id;
			stm.execute(sql);
			con.close();
			stm.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("admin.jsp");
	}else if(action.equals("save")){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, usr, pwd);
			stm = con.createStatement();
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String author = request.getParameter("author");
			String kind = request.getParameter("kind");
			Double price = Double.parseDouble(request.getParameter("price"));
			Integer remain = Integer.parseInt(request.getParameter("remain"));
			if(id != ""){
				sql = "update book set title='"+title+"',author='"
					+author+"',kind='"+kind+"',price="+price+",remain="+remain+" where id = "+id; 
			}else{
				sql = "insert into book (title,author,kind,price,remain,pic) values ('"
					+title+"','"+author+"','"+kind+"',"+price+","+remain+",'"+id+".jpg')";
			}
			System.out.println(sql);
 			stm.execute(sql);
			con.close();
			stm.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath()+"/cart?action=search&pageNo=");
	}else{
		response.sendRedirect("admin.jsp");
	}
%>