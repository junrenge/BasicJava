<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mytable.css">
</head>
<body>
	<center>
		<table class="mytable">
			<tr><td colspan="2"  style="border-left:0px; border-right:0px; border-top:0px">���ռ�</td></tr>
			<tr>
				<th style="width:35%">��������</th>
				<th style="width:35%">ָ������</th>
			</tr>
			<c:forEach var="rf" items="${requestScope.rfs}">
				<tr>
				<td>${rf.rname }</td>
				<td>${rf.fname }</td>
				</tr>
			</c:forEach>	
			<tr><td colspan="2"  style="border-left:0px; border-right:0px">���ۼ�</td></tr>
			<tr>
				<td>${eva.names }</td>
				<td>${eva.credits }</td>
			</tr>	
		</table>
		<br><br>
		<a href="fahp?method=confirm">ȷ��</a>&nbsp;&nbsp;<a href="factor?method=search">����ѡ��</a>
	</center>
</body>
</html>