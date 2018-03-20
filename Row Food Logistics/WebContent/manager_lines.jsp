<%@page import="com.tt.model.Line"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>运输专线管理</title>
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
<h1><a href=manager_home.jsp target="_blank">管理员登录</a>>>运输专线管理</h1>
<br><br>
<table>
	<tr>
		<th>线路名称</th>
		<th>线路</th>
		<th>类型</th>
		<th>时间</th>
	</tr>
	<%
		ArrayList cars = (ArrayList)request.getAttribute("lines");
		for(int i=0;i<cars.size();i++){
			Line c = (Line)cars.get(i);
			%>
				<tr>
					<td><%=c.getIdname() %></td>
					<td><%=c.getLines() %></td>
					<td><%=c.getType() %></td>
					<td><%=c.getTime() %></td>
					<td><a href="/Row_Food_Logistics/actionjsp/m_line.jsp?method=edit&id=<%=c.getId()%>">修改</a>&nbsp;<a href="/Row_Food_Logistics/actionjsp/m_line.jsp?method=delete&id=<%=c.getId()%>">删除</a></td>
				</tr>
			<%
		}
	%>
	<tr>
		<td><a href="/Row_Food_Logistics/actionjsp/m_line.jsp?method=edit&id=">添加</a></td>
	</tr>
</table>



</body>
</html>