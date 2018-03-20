<%@page import="com.tt.model.Goods"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>»õÎï¹ÜÀí</title>
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
<h1><a href=manager_home.jsp target="_blank">¹ÜÀíÔ±µÇÂ¼</a>>>»õÎï¹ÜÀí</h1>
<br><br>
<table>
	<tr>
		<th>»õÎïÃû³Æ</th>
		<th>ÎÂ¶È</th>
		<th>Êª¶È</th>
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
					<td><a href="/Row_Food_Logistics/actionjsp/m_goods.jsp?method=edit&id=<%=c.getId()%>">ÐÞ¸Ä</a>&nbsp;<a href="/Row_Food_Logistics/actionjsp/m_goods.jsp?method=delete&id=<%=c.getId()%>">É¾³ý</a></td>
				</tr>
			<%
		}
	%>
	<tr>
		<td><a href="/Row_Food_Logistics/actionjsp/m_goods.jsp?method=edit&id=">Ìí¼Ó</a></td>
	</tr>
</table>


</body>
</html>