<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

.highlight {
	background: #d0ddc0;
}
</style>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.7.min.js"></script>
<script type="text/javascript">
	$("document").ready(function() {
		$("#grade").val($("#s1").val());
		$("#clazz").val($("#s2").val());
		$("#term").val($("#s3").val());
	});
	
// 	function writeclassonce(cid) {
// 		alert(11);
<%-- 		var url = "<%=request.getContextPath()%>/class?method=writeclassonce"; --%>
// 		var date = {
// 			"time" : new Date(),
// 			"cweekday" : $("#cweekday_"+cid).val(),
// 			"ctime" : $("#ctime_"+cid).val(),
// 			"cid" : cid,
// 		};
// 		alert($("#cweekday_"+cid).val()+"-"+$("#ctime_"+cid).val());
// 		$.post(url, date,null);
// 	}
	
// 	function aa(){
// 		alert(11);
// 	}
</script>
</head>
<body marginwidth="50px">
	<input type="hidden" value="${s1 }" id="s1">
	<input type="hidden" value="${s2 }" id="s2">
	<input type="hidden" value="${s3 }" id="s3">
	<form action="class?method=search&type=4" method="post">
		<!-- 		课程号：<input type="text" name="cno" id="s1"> -->
		<!-- 		课程名：<input type="text" name="cname" id="s2"> -->

		年级:<select id="grade" name="grade" style="font-size: 16px"
			id="select1">
			<option value="">-选择年级-</option>
			<option value="1">大一</option>
			<option value="2">大二</option>
			<option value="3">大三</option>
			<option value="4">大四</option>
		</select> 班级:<select id="clazz" name="clazz" style="font-size: 16px"
			id="select2">
			<option selected value="">-选择班级-</option>
			<option value="1">计算机科学</option>
			<option value="2">软件工程</option>
			<option value="3">信息管理与信息系统</option>
		</select> 学期:<select id="term" name="term" style="font-size: 16px" id="select3">
			<option selected value="">-选择学期-</option>
			<option value="1">第一学期</option>
			<option value="2">第二学期</option>
		</select> <input type="submit" value="搜索" />
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
		</tr>
		<c:forEach var="c" items="${requestScope.classes}">
			<tr>
				<td>${c.cno }</td>
				<td>${c.cname }</td>
				<td>${c.cweekday }</td>
				<td>${c.ctime }</td>
				<td>${c.cplace }</td>
				<td>${c.cgrade }</td>
				<td>${c.cclass }</td>
				<td>${c.ccredit }</td>
				<td>${c.ctype }</td>
				<td>${c.ctag }</td>
				<td>${c.cterm }</td>
			</tr>
		</c:forEach>
	</table>
	<br>
</body>
</html>