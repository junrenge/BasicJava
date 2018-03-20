<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>学籍</title>
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
	margin-left: 100px;
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
<body>
	<c:set var="s" value="${requestScope.s}"/>  
	<table class="imagetable">
		<tr>
			<th>学号</th>
			<td>${s.sno}</td>
			<th>姓名</th>
			<td>${s.sname }</td>
		</tr>
		<tr>
			<th>性别</th>
			<td>${s.ssex }</td>
			<th>年龄</th>
			<td>${s.sage }</td>
		</tr>
		<tr>
			<th>身份证号</th>
			<td>${s.sid }</td>
			<th>出生日期</th>
			<td>${s.sbirth }</td>
		</tr>
		<tr>
			<th>籍贯</th>
			<td>${s.sjiguan }</td>
			<th>宿舍号</th>
			<td>${s.sdorm }</td>
		</tr>
		<tr>
			<th>手机</th>
			<td>${s.sphone }</td>
			<th>入学年份</th>
			<td>${s.sstartyear }</td>
		</tr>
		<tr>
			<th>学制</th>
			<td>${s.sstudymodel }</td>
			<th>院系</th>
			<td>${s.sdept }</td>
		</tr>
		<tr>
			<th>班级</th>
			<td>${s.sclass }</td>
			<th>密码</th>
			<td>${s.spw }</td>
		</tr>
	</table>
</body>
</html>