<%@page import="com.tt.model.Client"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<head>
<title>�ͻ�����</title>
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
<h1><a href=manager_home.jsp target="_blank">����Ա��¼</a>>>�ͻ�����</h1>
<br><br>
<form action="/Row_Food_Logistics/actionjsp/m_client.jsp?method=search" method="post">
	<input type="text" name="cname">
	<input type="submit" value="����">
</form>
<table>
	<tr>
		<th>��ҵ����</th>
		<th>�ͻ�����</th>
		<th>��ϵ������</th>
		<th>�绰</th>
		<th>����</th>
		<th>��ַ</th>
		<th>�ʸ���֤����</th>
	</tr>
	<%
		ArrayList clients = (ArrayList)request.getAttribute("clients");
		for(int i=0;i<clients.size();i++){
			Client c = (Client)clients.get(i);
			%>
				<tr>
					<td><%=c.getEnterprise_name() %></td>
					<td><%=c.getType() %></td>
					<td><%=c.getClient_name() %></td>
					<td><%=c.getPhone() %></td>
					<td><%=c.getEmail() %></td>
					<td><%=c.getAddress() %></td>
					<td><%=c.getCnumber() %></td>
				</tr>
			<%
		}
	%>
</table>
</body>
</html>