<%@ page contentType="text/html;charset=gb2312"%>
<%@page import="java.sql.*"%>
<%@ page import="src.com.yxq.valuebean.Users"%>
<%@ page import="src.com.yxq.toolbean.MyTools"%>
<html>
<head>
<title>登录检查</title>
</head>
<body>

	<%
	String loginname = request.getParameter("username");
	String loginpsw = request.getParameter("password");
	Connection con;
	Statement stm;
	ResultSet rst;
	ResultSetMetaData rsmd;
	String sql = "select * from users";
	String url = "jdbc:mysql://127.0.0.1/testjdbc";
	String usr = "root";
	String pwd = "root";

	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url, usr, pwd);
		stm = con.createStatement();
		rst = stm.executeQuery(sql);
 		while (rst.next()) {
 			String username = rst.getString(2);
 			String password = rst.getString(3);
 			int admin = rst.getInt(4);
 			if(loginname.equals(username) && loginpsw.equals(password)){
 				//分为管理员和用户
 				if(admin == 0){
					request.getRequestDispatcher("/admin.jsp").forward(request, response);
 				}else{
					request.getRequestDispatcher("/test3.jsp").forward(request, response);
 				}
					break;
 			}else{
 				//报错
 				out.print(loginname+"***"+username);
 			}
		}
		con.close();
		stm.close();

	} catch (Exception e1) {
		e1.printStackTrace();
		out.println("Query Error！");
	}
%>

</body>
</html>