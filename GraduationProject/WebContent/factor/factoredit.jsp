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
	<form action="factor?method=save&id=${requestScope.factor.id }" method="post">
		<table class="mytable">
			<tr>
				<td style="width : 40%">指标名称:</td>
				<td><input type="text" name="name" value="${requestScope.factor.fname }"></td>
			</tr>
			<tr>
				<td>风险类型：</td>
				<td>
					<select name="rid">
						<c:forEach var="r" items="${requestScope.risks }">
							<c:choose>
								<c:when test="${r.id eq requestScope.factor.rid }">
									<option value="${r.id }" selected="selected">${r.name }</option>
								</c:when>
								<c:otherwise>
									<option value="${r.id }">${r.name }</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr><td colspan="2"><input type="submit" value="确定" style="width:15%"></td></tr>
		</table>
		<br><br>
	</form>
	</center>
</body>
</html>