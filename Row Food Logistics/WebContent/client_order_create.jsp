<%@page import="com.tt.model.Line"%>
<%@page import="com.tt.model.Goods"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<head>
<title>��������</title>
<style type="text/css">
body{font-family:����;}
p{font-size:25px;color:grey;}
.stress{font-size:40px;color:#CE0000;}
a{color:white;}
h1{font-size:20px;color:white;background-color:#474747;top-height:10px;}
</style>
</head>
<body>
<center>
<p><span class="stress">��������|</span>�������������Ǹ�רҵ</p>
</center>
<!-- hr size=10 color=#474747  -->
<h1><a href=/Row_Food_Logistics/client_home.jsp target="_blank">�ͻ���¼</a><a href=/Row_Food_Logistics/client_order.jsp target="_blank">>>��������</a>>>��������</h1>
<br><br>
<form action="/Row_Food_Logistics/actionjsp/order.jsp?method=update&id=&cid=<%=session.getAttribute("cid") %>" method="post">
<table>
	<tr>
		<td>�ջ���</td><td><input type="text" name="name2"></td>
	</tr>
	<tr>
		<td>�ջ�����ϵ��ʽ</td><td><input type="text" name="phone2"></td>
	</tr>
	<tr>
		<td>�ջ��������ַ</td><td><input type="text" name="email2"></td>
	</tr>
	<tr>
		<td>�ջ���ַ</td><td><input type="text" name="address2"></td>
	</tr>
	<tr>
		<td>��������</td><td><select name="goods_name">
							<%
								ArrayList goods = (ArrayList)request.getAttribute("goods");
								for(int i=0;i<goods.size();i++){
									Goods g = (Goods)goods.get(i);
									%>
										<option><%=g.getName() %></option>
									<%
								}
							%>
						   </select></td>
	</tr>
	<tr>
		<td>��������</td><td><input type="text" name="goods_weight"></td>
	</tr>
	<tr>
		<td>�������¶�</td><td><select name="goods_tem">
								<option>D</option>
								<option>E</option>
								<option>F</option>
							  </td>
	</tr>
	<tr>
		<td>�����������</td><td><input type="text" name="goods_time"></td>
	</tr>
	<tr>
		<td>������·</td><td><select name="line">
							<%
								ArrayList lines = (ArrayList)request.getAttribute("lines");
								for(int i=0;i<lines.size();i++){
									Line g = (Line)lines.get(i);
									%>
										<option><%=g.getLines() %></option>
									<%
								}
							%>
						   </select></td>
	</tr>
	<tr>
		<td><input type="submit" value="�ύ����"></td>
	</tr>
</table>
</form>
</body>
</html>