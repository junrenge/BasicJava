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
	out.println("Query Error��");
}
%>
<html>
</html>
<center>
	<body background="fruit.jpg">
	<h4><a href="charts.jsp">����ͳ��</a><a href="index.jsp" style="float: right;">��½</a></h4>
		<table border="1" width="650" rules="none" cellspacing="0"
			cellpadding="5" style="background: #eeeeff">
			<tr height="50">
				<td colspan="3" align="center">����ͼ��</td>
			</tr>

			<!-- 	��ҳ���� -->
			<tr align="center" height="30" bgcolor="lightgrey">
				<td></td>
				<td>����</td>
				<td>����</td>
				<td>�۸�(Ԫ)</td>
				<td>ʣ������</td>
				<td>����</td>
				<td>����</td>
				<td colspan="2">����</td>
			</tr>
			<%
				if (goodslist == null || goodslist.size() == 0) {
			%>
			<tr height="100">
				<td colspan="3" align="center">û��ͼ�����ʾ��</td>
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
				<td><a href="admindo.jsp?action=edit&id=<%=single.getId()%>">�޸�</a></td>
				<td><a href="admindo.jsp?action=delete&id=<%=single.getId()%>">ɾ��</a></td>
			</tr>
			<%
				}
				}
			%>
			<!-- 	��ҳ���ܽ��� -->
			<tr height="50">
				<td align="right" colspan="9"><a href="admindo.jsp?action=create">���ͼ��</a></td>
			</tr>
		</table>
	</body>
</center>
