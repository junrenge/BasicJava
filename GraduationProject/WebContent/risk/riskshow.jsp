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
				<th style="width : 70%">风险类型</th>
				<th>操作</th>
			</tr>
			
			<c:forEach var="risk" items="${requestScope.risks}">
			 <tr>
				<td>${risk.name }</td>
				<td><a href="risk?method=edit&id=${risk.id }">修改</a>&nbsp;<a href="risk?method=delete&id=${risk.id }">删除</a></td>
			 </tr>
			</c:forEach>
		</table>
		<br><br>
		<a href="risk?method=edit&id=">添加</a>
	</center>
</body>
</html>