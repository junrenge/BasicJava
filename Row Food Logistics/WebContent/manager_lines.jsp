<%@page import="com.tt.model.Line"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>����ר�߹���</title>
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
<h1><a href=manager_home.jsp target="_blank">����Ա��¼</a>>>����ר�߹���</h1>
<br><br>
<table>
	<tr>
		<th>��·����</th>
		<th>��·</th>
		<th>����</th>
		<th>ʱ��</th>
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
					<td><a href="/Row_Food_Logistics/actionjsp/m_line.jsp?method=edit&id=<%=c.getId()%>">�޸�</a>&nbsp;<a href="/Row_Food_Logistics/actionjsp/m_line.jsp?method=delete&id=<%=c.getId()%>">ɾ��</a></td>
				</tr>
			<%
		}
	%>
	<tr>
		<td><a href="/Row_Food_Logistics/actionjsp/m_line.jsp?method=edit&id=">���</a></td>
	</tr>
</table>



</body>
</html>