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
<h1><a href=manager_home.jsp target="_blank" style="color:white">����Ա��¼</a>>>�����豸����</h1>
<br><br>
<form action="/Row_Food_Logistics/actionjsp/m_car.jsp?method=search" method="post">
	�豸��ţ�<input type="text" name="carname">&nbsp;&nbsp;
	�������ͣ�<input type="text" name="type">
	<input type="submit" value="����">
</form>
<table>
	<tr>
		<th>�豸���</th>
		<th>��������</th>
		<th>�����豸</th>
		<th>����</th>
		<th>��������</th>
		<th>װ����׼</th>
		<th>�༭</th>
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
					<td><a href="/Row_Food_Logistics/actionjsp/m_car.jsp?method=edit&id=<%=c.getId()%>">�޸�</a>&nbsp;<a href="/Row_Food_Logistics/actionjsp/m_car.jsp?method=delete&id=<%=c.getId()%>">ɾ��</a></td>
				</tr>
			<%
		}
	%>
	<tr>
		<td><a href="/Row_Food_Logistics/actionjsp/m_car.jsp?method=edit&id=">���</a></td>
	</tr>
</table>
</body>
</html>