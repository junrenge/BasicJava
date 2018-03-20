<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>选择授课</title>
<style type="text/css">
table.imagetable {
	font-family: verdana, arial, sans-serif;
	font-size: 11px;
	color: #333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
	width: 60%;
	margin-top: 10px;
}

table.imagetable th {
	background: #b5cfd2 url('blue.jpg');
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
}

table.imagetable td {
	background: #dcddc0 url('grey.jpg');
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
}
</style>
</head>
<body marginwidth="100px">

	<form action="" method="post">
	<table class="imagetable">
		<tr>
			<th>课程号</th>
			<th>课程名</th>
			<th>录入</th>
		</tr>
		<c:forEach var="c" items="${requestScope.selectedclasses}">
		  <tr>
   			<td>${c.cno }</td>
   			<td>${c.cname }</td>
   			<td><a href="sc?method=searchone&cno=${c.cno }">录入</a></td>
          </tr>
		</c:forEach>
	</table>
	</form>

</body>
</html>