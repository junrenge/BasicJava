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
		课程号：<input type="text" name="cno" id="s1">
		课程名：<input type="text" name="cname" id="s2">
		<input type="submit" value="搜索" />
	</form>	

	<table class="imagetable">
		<tr>
			<th>课程号</th>
			<th>课程名</th>
			<th>周几上课</th>
			<th>上课时间</th>
			<th>上课地点</th>
			<th>年级</th>
			<th>班级</th>
			<th>学分</th>
			<th>类型</th>
			<th>是否有人授课</th>
			<th>学期</th>
			<th>操作</th>
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
   			<td><a href="class?method=delete&id=${c.id }">删除</a></td>
          </tr>
		</c:forEach>
	</table>
	<br>
	<a href="class?method=create&id=">增加新课程</a>

</body>
</html>