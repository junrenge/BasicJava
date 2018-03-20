<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mytable.css">
</head>
<body>
	<center>
		<table class="mytable">
			<tr>
				<th style="width : 70%">��������</th>
				<th>����</th>
			</tr>
			
			<c:forEach var="risk" items="${requestScope.risks}">
			 <tr>
				<td>${risk.name }</td>
				<td><a href="risk?method=edit&id=${risk.id }">�޸�</a>&nbsp;<a href="risk?method=delete&id=${risk.id }">ɾ��</a></td>
			 </tr>
			</c:forEach>
		</table>
		<br><br>
		<a href="risk?method=edit&id=">���</a>
	</center>
</body>
</html>