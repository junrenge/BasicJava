<%@page import="com.tt.model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<head>
<title>ǩ��ȷ��</title>
<style type="text/css">
body{font-family:����;}
p{font-size:25px;color:grey;}
.stress{font-size:40px;color:#CE0000;}
a{color:black;}
h1{font-size:20px;color:white;background-color:#474747;top-height:10px;}
</style>
</head>
<body>
<center>
<p><span class="stress">��������|</span>�������������Ǹ�רҵ</p>
</center>
<!-- hr size=10 color=#474747  -->
<h1><a href=/Row_Food_Logistics/client_home.jsp target="_blank">�ͻ���¼</a><a href=/Row_Food_Logistics/client_order.jsp target="_blank">>>��������</a>>>ǩ��ȷ��</h1>
<br><br>
<form action="/Row_Food_Logistics/actionjsp/order.jsp?method=search" method="post">
	������ҵ��<input type="text" name="enterprise1">&nbsp;&nbsp;
	<input type="submit" value="����">
</form>
<table style="float:left;width:45%">
	<tr>
		<th>������ҵ</th>
		<th>����������</th>
		<th>�����豸</th>
		<th>����</th>
		<th>��������</th>
		<th>װ����׼</th>
		<th>ǩ��ȷ��</th>
	</tr>
	<%
		ArrayList os = (ArrayList)request.getAttribute("os");
		for(int i=0;i<os.size();i++){
			Order c = (Order)os.get(i);
			if(c.getReceive().equals("0")){
			%>
				<tr>
					<td><%=c.getEnterprise1() %></td>
					<td><%=c.getName1() %></td>
					<td><%=c.getName1() %></td>
					<td><%=c.getName1() %></td>
					<td><%=c.getName1() %></td>
					<td><%=c.getName1() %></td>
					<td><a href="/Row_Food_Logistics/actionjsp/order.jsp?method=receive&id=<%=c.getId() %>">���ǩ��</a></td>
				</tr>
			<%
			}
		}
	%>
</table>

<table style="float:left;width:45%; padding-left:30px">
	<tr>
		<th>������ҵ</th>
		<th>����������</th>
		<th>�����豸</th>
		<th>����</th>
		<th>��������</th>
		<th>װ����׼</th>
		<th>ǩ��ȷ��</th>
	</tr>
	<%
		for(int i=0;i<os.size();i++){
			Order c = (Order)os.get(i);
			if(c.getReceive().equals("1")){
			%>
				<tr>
					<td><%=c.getEnterprise1() %></td>
					<td><%=c.getName1() %></td>
					<td><%=c.getName1() %></td>
					<td><%=c.getName1() %></td>
					<td><%=c.getName1() %></td>
					<td><%=c.getName1() %></td>
					<td>��ǩ��</td>
				</tr>
			<%
			}
		}
	%>
</table>
</body>
</html>