<%@page import="com.tt.model.Car"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ÔËÊäÉè±¸¹ÜÀí</title>
<style type="text/css">
body{font-family:¿¬Ìå;}
p{font-size:25px;color:grey;}
.stress{font-size:40px;color:#CE0000;}
a{color:black;}
h1{font-size:20px;color:white;background-color:#474747;top-height:10px;}
</style>
</head>
<body>
<center>
<p><span class="stress">ÄþÏÊÎïÁ÷|</span>ÉúÏÊÎïÁ÷£¬ÎÒÃÇ¸ü×¨Òµ</p>
</center>
<!-- hr size=10 color=#474747  -->
<h1><a href=manager_home.jsp target="_blank" style="color:white">¹ÜÀíÔ±µÇÂ¼</a>>>ÔËÊäÉè±¸¹ÜÀí</h1>
<br><br>
<form action="/Row_Food_Logistics/actionjsp/m_car.jsp?method=search" method="post">
	Éè±¸±àºÅ£º<input type="text" name="carname">&nbsp;&nbsp;
	ÔËÊäÀàÐÍ£º<input type="text" name="type">
	<input type="submit" value="ËÑË÷">
</form>
<table>
	<tr>
		<th>Éè±¸±àºÅ</th>
		<th>ÔËÊäÀàÐÍ</th>
		<th>ÖÆÀäÉè±¸</th>
		<th>ÔØÖØ</th>
		<th>ÏÐÖÃÊýÁ¿</th>
		<th>×°³µ±ê×¼</th>
		<th>±à¼­</th>
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
					<td><a href="/Row_Food_Logistics/actionjsp/m_car.jsp?method=edit&id=<%=c.getId()%>">ÐÞ¸Ä</a>&nbsp;<a href="/Row_Food_Logistics/actionjsp/m_car.jsp?method=delete&id=<%=c.getId()%>">É¾³ý</a></td>
				</tr>
			<%
		}
	%>
	<tr>
		<td><a href="/Row_Food_Logistics/actionjsp/m_car.jsp?method=edit&id=">Ìí¼Ó</a></td>
	</tr>
</table>
</body>
</html>