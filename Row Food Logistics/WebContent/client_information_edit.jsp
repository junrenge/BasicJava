<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<head>
<title>�ͻ���Ϣ����</title>
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
<h1><a href=client_home.jsp target="_blank">�ͻ���¼</a>>>��Ϣ����</h1>
<br><br>
<form action="/Row_Food_Logistics/actionjsp/c_info.jsp?method=update&id=${requestScope.client.id }" method="post">
<table>
<input type="hidden" value="<%=request.getParameter("id") %>">
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
		<td><input type="text" name="ename" value="${requestScope.client.enterprise_name }"></td>
		<td><input type="text" name="type" value="${requestScope.client.type }"></td>
		<td><input type="text" name="cname" value="${requestScope.client.client_name }"></td>
		<td><input type="text" name="password" value="${requestScope.client.password }"></td>
		<td><input type="text" name="phone" value="${requestScope.client.phone }"></td>
		<td><input type="text" name="email" value="${requestScope.client.email }"></td>
		<td><input type="text" name="address" value="${requestScope.client.address }"></td>
		<td><input type="text" name="cnumber" value="${requestScope.client.cnumber }"></td>
	</tr>			
	<tr>
		<td><input type="submit" value="�ύ"></td>
	</tr>
</table>
</form>



</body>
</html>