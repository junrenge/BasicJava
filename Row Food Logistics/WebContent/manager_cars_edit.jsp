<%@page import="com.tt.model.Car"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>运输设备管理</title>
<style type="text/css">
body{font-family:楷体;}
p{font-size:25px;color:grey;}
.stress{font-size:40px;color:#CE0000;}
a{color:black;}
h1{font-size:20px;color:white;background-color:#474747;top-height:10px;}
</style>
</head>
<body>
<center>
<p><span class="stress">宁鲜物流|</span>生鲜物流，我们更专业</p>
</center>
<!-- hr size=10 color=#474747  -->
<h1><a href=manager_home.jsp target="_blank" style="color:white">管理员登录</a>>>运输设备管理</h1>
<br><br>
<form action="/Row_Food_Logistics/actionjsp/m_car.jsp?method=update&id=${requestScope.car.id }" method="post">
<table>
<input type="hidden" value="<%=request.getParameter("id") %>">
	<tr>
		<th>设备编号</th>
		<th>运输类型</th>
		<th>制冷设备</th>
		<th>载重</th>
		<th>闲置数量</th>
		<th>装车标准</th>
	</tr>
	<tr>
		<td><input type="text" name="idname" value="${requestScope.car.idname }"></td>
		<td><input type="text" name="type" value="${requestScope.car.type }"></td>
		<td><input type="text" name="device" value="${requestScope.car.idname }"></td>
		<td><input type="text" name="tons" value="${requestScope.car.type }"></td>
		<td><input type="text" name="remain" value="${requestScope.car.type }"></td>
		<td><input type="text" name="standard" value="${requestScope.car.type }"></td>
	</tr>			
	<tr>
		<td><input type="submit" value="提交"></td>
	</tr>
</table>
</form>
</body>
</html>