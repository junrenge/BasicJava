<%@page import="com.tt.model.Car"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>�����豸����</title>
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
<h1><a href=manager_home.jsp target="_blank" style="color:white">����Ա��¼</a>>>�������</h1>
<br><br>
<form action="/Row_Food_Logistics/actionjsp/m_goods.jsp?method=update&id=${requestScope.goods.id }" method="post">
<table>
<input type="hidden" value="<%=request.getParameter("id") %>">
	<tr>
		<th>��������</th>
		<th>�¶�</th>
		<th>ʪ��</th>
	</tr>
	<tr>
		<td><input type="text" name="name" value="${requestScope.goods.name }"></td>
		<td><input type="text" name="tem" value="${requestScope.goods.tem }"></td>
		<td><input type="text" name="humidity" value="${requestScope.goods.humidity }"></td>
	</tr>			
	<tr>
		<td><input type="submit" value="�ύ"></td>
	</tr>
</table>
</form>
</body>
</html>