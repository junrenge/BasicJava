<%@page import="com.tt.model.Goods"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>货物管理</title>
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
<h1><a href=manager_home.jsp target="_blank">管理员登录</a>>>货物管理</h1>
<br><br>
<table>
	<tr>
		<th>货物名称</th>
		<th>温度</th>
		<th>湿度</th>
	</tr>
	<%
		ArrayList cars = (ArrayList)request.getAttribute("goods");
		for(int i=0;i<cars.size();i++){
			Goods c = (Goods)cars.get(i);
			%>
				<tr>
					<td><%=c.getName() %></td>
					<td><%=c.getTem() %></td>
					<td><%=c.getHumidity() %></td>
					<td><a href="/Row_Food_Logistics/actionjsp/m_goods.jsp?method=edit&id=<%=c.getId()%>">修改</a>&nbsp;<a href="/Row_Food_Logistics/actionjsp/m_goods.jsp?method=delete&id=<%=c.getId()%>">删除</a></td>
				</tr>
			<%
		}
	%>
	<tr>
		<td><a href="/Row_Food_Logistics/actionjsp/m_goods.jsp?method=edit&id=">添加</a></td>
	</tr>
</table>


</body>
</html>