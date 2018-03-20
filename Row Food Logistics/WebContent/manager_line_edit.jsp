<%@page import="com.tt.model.Car"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<head>
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
<h1><a href=manager_home.jsp target="_blank" style="color:white">管理员登录</a>>>运输路线管理</h1>
<br><br>
<form action="/Row_Food_Logistics/actionjsp/m_line.jsp?method=update&id=${requestScope.line.id }" method="post">
<table>
<input type="hidden" value="<%=request.getParameter("id") %>">
	<tr>
		<th>线路名称</th>
		<th>线路</th>
		<th>类型</th>
		<th>时间</th>
	</tr>
	<tr>
		<td><input type="text" name="idname" value="${requestScope.line.idname }"></td>
		<td><input type="text" name="lines" value="${requestScope.line.lines }"></td>
		<td><input type="text" name="type" value="${requestScope.line.type }"></td>
		<td><input type="text" name="time" value="${requestScope.line.time }"></td>
	</tr>			
	<tr>
		<td><input type="submit" value="提交"></td>
	</tr>
</table>
</form>
</body>
</html>