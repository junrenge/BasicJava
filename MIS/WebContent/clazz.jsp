<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>ѡ���ڿ�</title>
<style type="text/css">
table.imagetable {
	font-family: verdana, arial, sans-serif;
	font-size: 11px;
	color: #333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
	width: 80%;
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
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.7.min.js"></script>
<script type="text/javascript">
$("document").ready(function(){ 
	$("#s1").val($("#ss1").val());
	$("#s2").val($("#ss2").val());
});
</script>
</head>
<body marginwidth="50px">

	<input type="hidden" value="${cno }" id="ss1">
	<input type="hidden" value="${cname }" id="ss2">
	<form action="class?method=searchbykeyword" method="post">
		�γ̺ţ�<input type="text" name="cno" id="s1">
		�γ�����<input type="text" name="cname" id="s2">
		<input type="submit" value="����" />
	</form>	

	<table class="imagetable">
		<tr>
			<th>�γ̺�</th>
			<th>�γ���</th>
			<th>�ܼ��Ͽ�</th>
			<th>�Ͽ�ʱ��</th>
			<th>�Ͽεص�</th>
			<th>�꼶</th>
			<th>�༶</th>
			<th>ѧ��</th>
			<th>����</th>
			<th>�Ƿ������ڿ�</th>
			<th>ѧ��</th>
			<th>����</th>
		</tr>
		<c:forEach var="c" items="${requestScope.all}">
		  <tr>
   			<td>${c.cno }</td>
   			<td><a href="class?method=edit&id=${c.id }">${c.cname }</a></td>
   			<td>${c.cweekday }</td>
   			<td>${c.ctime }</td>
   			<td>${c.cplace }</td>
   			<td>${c.cgrade }</td>
   			<td>${c.cclass }</td>
   			<td>${c.ccredit }</td>
   			<td>${c.ctype }</td>
   			<td>${c.ctag }</td>
   			<td>${c.cterm }</td>
   			<td><a href="class?method=delete&id=${c.id }">ɾ��</a></td>
          </tr>
		</c:forEach>
	</table>
	<br>
	<a href="class?method=create&id=">�����¿γ�</a>

</body>
</html>