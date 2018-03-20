<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="src.com.yxq.valuebean.Book"%>
<%@page import="java.sql.*"%>
<%
ArrayList goodslist = new ArrayList();
Connection con;
Statement stm;
ResultSet rst;
ResultSetMetaData rsmd;
String sql = "select * from book";
String url = "jdbc:mysql://127.0.0.1/testjdbc";
String usr = "root";
String pwd = "root";
try {
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(url, usr, pwd);
	stm = con.createStatement();
	rst = stm.executeQuery(sql);
	rsmd = rst.getMetaData();
	int i = 0;
	while (rst.next()) {
		Book single = new Book();
		single.setId(rst.getInt("id"));
		single.setTitle(rst.getString("title"));
		single.setAuthor(rst.getString("author"));
		single.setPrice(rst.getDouble("price"));
		single.setRemain(rst.getInt("remain"));
		single.setSales(rst.getInt("sales"));
		single.setKind(rst.getString("kind"));
		single.setPic(rst.getString("pic"));
		single.setTempno(0);
		goodslist.add(i++, single); 
	}
	session.setAttribute("goodslist", goodslist);
	con.close();
	stm.close();
} catch (Exception e) {
	e.printStackTrace();
	out.println("Query Error！");
}
%>
<html>
</html>
<center>
	<body background="fruit.jpg">
	<h4><a href="charts.jsp">销售统计</a><a href="index.jsp" style="float: right;">登陆</a></h4>
		<table border="1" width="650" rules="none" cellspacing="0"
			cellpadding="5" style="background: #eeeeff">
			<tr height="50">
				<td colspan="3" align="center">今日图书</td>
			</tr>

			<!-- 	分页功能 -->
			<tr align="center" height="30" bgcolor="lightgrey">
				<td></td>
				<td>书名</td>
				<td>作者</td>
				<td>价格(元)</td>
				<td>剩余数量</td>
				<td>销量</td>
				<td>种类</td>
				<td colspan="2">操作</td>
			</tr>
			<%
				if (goodslist == null || goodslist.size() == 0) {
			%>
			<tr height="100">
				<td colspan="3" align="center">没有图书可显示！</td>
			</tr>
			<%
				} else {
					for (int i = 0; i < goodslist.size(); i++) {
						Book single = (Book) goodslist.get(i);
			%>
			<tr height="50" align="center">
				<td><img width="65" hight="65" src="<%=request.getContextPath() %>/pic.jsp?picid=<%=single.getId() %>.jpg"></td>
				<td><%=single.getTitle()%></td>
				<td><%=single.getAuthor()%></td>
				<td><%=single.getPrice()%></td>
				<td><%=single.getRemain()%></td>
				<td><%=single.getSales()%></td>
				<td><%=single.getKind()%></td>
				<td><a href="admindo.jsp?action=edit&id=<%=single.getId()%>">修改</a></td>
				<td><a href="admindo.jsp?action=delete&id=<%=single.getId()%>">删除</a></td>
			</tr>
			<%
				}
				}
			%>
			<!-- 	分页功能结束 -->
			<tr height="50">
				<td align="right" colspan="9"><a href="admindo.jsp?action=create">添加图书</a></td>
			</tr>
		</table>
	</body>
</center>
