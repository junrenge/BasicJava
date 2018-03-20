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
<form action="/Row_Food_Logistics/actionjsp/m_car.jsp?method=search" method="post">
	设备编号：<input type="text" name="carname">&nbsp;&nbsp;
	运输类型：<input type="text" name="type">
	<input type="submit" value="搜索">
</form>
<table>
	<tr>
		<th>设备编号</th>
		<th>运输类型</th>
		<th>制冷设备</th>
		<th>载重</th>
		<th>闲置数量</th>
		<th>装车标准</th>
		<th>编辑</th>
	</tr>
	<%
		ArrayList cars = (ArrayList)request.getAttribute("cars");
		for(int i=0;i<cars.size();i++){
			Car c = (Car)cars.get(i);
			%>
				<tr>
					<td><%=c.getIdname() %></td>
					<td><%=c.getType() %></td>
					<td><%=c.getDevice() %></td>
					<td><%=c.getTons() %></td>
					<td><%=c.getRemain() %></td>
					<td><%=c.getStandard() %></td>
					<td><a href="/Row_Food_Logistics/actionjsp/m_car.jsp?method=edit&id=<%=c.getId()%>">修改</a>&nbsp;<a href="/Row_Food_Logistics/actionjsp/m_car.jsp?method=delete&id=<%=c.getId()%>">删除</a></td>
				</tr>
			<%
		}
	%>
	<tr>
		<td><a href="/Row_Food_Logistics/actionjsp/m_car.jsp?method=edit&id=">添加</a></td>
	</tr>
</table>
</body>
</html>