<%@page import="com.tt.model.Car"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<head>
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
<h1><a href=manager_home.jsp target="_blank" style="color:white">����Ա��¼</a>>>����·�߹���</h1>
<br><br>
<form action="/Row_Food_Logistics/actionjsp/m_line.jsp?method=update&id=${requestScope.line.id }" method="post">
<table>
<input type="hidden" value="<%=request.getParameter("id") %>">
	<tr>
		<th>��·����</th>
		<th>��·</th>
		<th>����</th>
		<th>ʱ��</th>
	</tr>
	<tr>
		<td><input type="text" name="idname" value="${requestScope.line.idname }"></td>
		<td><input type="text" name="lines" value="${requestScope.line.lines }"></td>
		<td><input type="text" name="type" value="${requestScope.line.type }"></td>
		<td><input type="text" name="time" value="${requestScope.line.time }"></td>
	</tr>			
	<tr>
		<td><input type="submit" value="�ύ"></td>
	</tr>
</table>
</form>
</body>
</html>