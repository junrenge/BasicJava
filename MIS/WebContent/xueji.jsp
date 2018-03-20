<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>ѧ��</title>
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
			<th>ѧ��</th>
			<td>${s.sno}</td>
			<th>����</th>
			<td>${s.sname }</td>
		</tr>
		<tr>
			<th>�Ա�</th>
			<td>${s.ssex }</td>
			<th>����</th>
			<td>${s.sage }</td>
		</tr>
		<tr>
			<th>���֤��</th>
			<td>${s.sid }</td>
			<th>��������</th>
			<td>${s.sbirth }</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${s.sjiguan }</td>
			<th>�����</th>
			<td>${s.sdorm }</td>
		</tr>
		<tr>
			<th>�ֻ�</th>
			<td>${s.sphone }</td>
			<th>��ѧ���</th>
			<td>${s.sstartyear }</td>
		</tr>
		<tr>
			<th>ѧ��</th>
			<td>${s.sstudymodel }</td>
			<th>Ժϵ</th>
			<td>${s.sdept }</td>
		</tr>
		<tr>
			<th>�༶</th>
			<td>${s.sclass }</td>
			<th>����</th>
			<td>${s.spw }</td>
		</tr>
	</table>
</body>
</html>