<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<head>
<title>�ͻ���Ϣ����</title>
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
<h1><a href=client_home.jsp target="_blank">�ͻ���¼</a>>>��Ϣ����</h1>
<br><br>
<table>
	<tr>
		<th>��ҵ����</th>
		<th>��ҵ����</th>
		<th>��ϵ������</th>
		<th>����</th>
		<th>�绰</th>
		<th>����</th>
		<th>��ַ</th>
		<th>��֤���к�</th>
	</tr>
	<tr>
		<td>${requestScope.client.enterprise_name }</td>
		<td>${requestScope.client.type }</td>
		<td>${requestScope.client.client_name }</td>
		<td>${requestScope.client.password }</td>
		<td>${requestScope.client.phone }</td>
		<td>${requestScope.client.email }</td>
		<td>${requestScope.client.address }</td>
		<td>${requestScope.client.cnumber }</td>
	</tr>			
	<tr>
		<td><a href="/Row_Food_Logistics/actionjsp/c_info.jsp?method=edit&id=${requestScope.client.id }">�޸�</a></td>
	</tr>
</table>
</body>
</html>