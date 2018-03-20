<%@ page language="java" contentType="text/html; charset=gb2312" pageEncoding="gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mytable.css">
<html>
<head>
<style type="text/css">
input{
	border:0;
	align:center;
	width:100%;
	height:100%;
}
</style>
</head>
<body>
	<center>
	<form action="risk?method=save&id=${requestScope.risk.id }" method="post">
		<table class="mytable">
			<tr>
				<td style="width : 40%">风险类型:</td>
				<td><input type="text" name="name" value="${requestScope.risk.name }"></td>
			</tr>
			<tr><td colspan="2"><input type="submit" value="确定" style="width:15%"></td></tr>
		</table>
		<br><br>
	</form>
	</center>
</body>
</html>