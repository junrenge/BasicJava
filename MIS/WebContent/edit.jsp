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
	$("input[name='cweekday'][value="+$("#s1").val()+"]").attr("checked",true); 
	$("input[name='ctime'][value="+$("#s2").val()+"]").attr("checked",true); 
	$("input[name='cgrade'][value="+$("#s3").val()+"]").attr("checked",true); 
	$("input[name='cclass'][value="+$("#s4").val()+"]").attr("checked",true); 
	$("input[name='ctype'][value="+$("#s5").val()+"]").attr("checked",true); 
	$("input[name='ctag'][value="+$("#s6").val()+"]").attr("checked",true); 
	$("input[name='cterm'][value="+$("#s7").val()+"]").attr("checked",true); 
});
</script>
</head>
<body marginwidth="50px">

	<input id="s1" value="${c.cweekday }" type="hidden">
	<input id="s2" value="${c.ctime }" type="hidden">
	<input id="s3" value="${c.cgrade }" type="hidden">
	<input id="s4" value="${c.cclass }" type="hidden">
	<input id="s5" value="${c.ctype }" type="hidden">
	<input id="s6" value="${c.ctag }" type="hidden">
	<input id="s7" value="${c.cterm }" type="hidden">
	
	<form action="class?method=update&id=${c.id }" method="post">
	<table class="imagetable">
		<tr>
			<th>课程号</th><td><input type="text" name="cno" value="${ c.cno}"></td>
		</tr>
		<tr>
			<th>课程名</th><td><input type="text" name="cname" value="${ c.cname}"></td>
		</tr>
		<tr>
			<th>周几上课</th><td><input type="radio" name="cweekday" value="1">周一<input type="radio" name="cweekday" value="2">周二<input type="radio" name="cweekday" value="3">周三<input type="radio" name="cweekday" value="4">周四<input type="radio" name="cweekday" value="5">周五</td>
		</tr>
		<tr>
			<th>上课时间</th><td><input type="radio" name="ctime" value="1">上午<input type="radio" name="ctime" value="2">下午</td>
		</tr>
		<tr>
			<th>上课地点</th><td><input type="text" name="cplace" value="${ c.cplace}"></td>
		</tr>
		<tr>
			<th>年级</th><td><input type="radio" name="cgrade" value="1">大一<input type="radio" name="cgrade" value="2">大二<input type="radio" name="cgrade" value="3">大三<input type="radio" name="cgrade" value="4">大四</td>
		</tr>
		<tr>
			<th>班级</th><td><input type="radio" name="cclass" value="1">1<input type="radio" name="cclass" value="2">2<input type="radio" name="cclass" value="3">3</td>
		</tr>
		<tr>
			<th>学分</th><td><input type="text" name="ccredit" value="${c.ccredit }"></td>
		</tr>
		<tr>
			<th>类型</th><td><input type="radio" name="ctype" value="0">必修<input type="radio" name="ctype" value="1">选修</td>
		</tr>
		<tr>
			<th>是否有人授课</th><td><input type="radio" name="ctag" value="0">无<input type="radio" name="ctag" value="1">有</td>
		</tr>
		<tr>
			<th>学期</th><td><input type="radio" name="cterm" value="1">第一学期<input type="radio" name="cterm" value="2">第二学期</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="确定" /></td>
		</tr>
	</table>
<!-- 	<sapn> -->
<%-- 		课程号：<input type="text" name="cno" value="${ c.cno}"><br><br> --%>
<%-- 	            课程名：<input type="text" name="cname" value="${ c.cname}"><br><br> --%>
<!-- 		上课日期：<input type="radio" name="cweekday" value="1">周一<input type="radio" name="cweekday" value="2">周二<input type="radio" name="cweekday" value="3">周三<input type="radio" name="cweekday" value="4">周四<input type="radio" name="cweekday" value="5">周五<br><br> -->
<!-- 		上课时间：<input type="radio" name="ctime" value="1">上午<input type="radio" name="ctime" value="2">下午<br><br> -->
<%-- 		上课地点：<input type="text" name="cplace" value="${ c.cplace}"><br><br> --%>
<!-- 		年级：<input type="radio" name="cgrade" value="1">大一<input type="radio" name="cgrade" value="2">大二<input type="radio" name="cgrade" value="3">大三<input type="radio" name="cgrade" value="4">大四<br><br> -->
<!-- 		班级：<input type="radio" name="cclass" value="1">1<input type="radio" name="cclass" value="2">2<input type="radio" name="cclass" value="3">3<br><br> -->
<%-- 		学分：<input type="text" name="ccredit" value="${c.ccredit }"><br><br> --%>
<!-- 		类型：<input type="radio" name="ctype" value="0">必修<input type="radio" name="ctype" value="1">选修<br><br> -->
<!-- 		是否有人授课：<input type="radio" name="ctag" value="0">无<input type="radio" name="ctag" value="1">有<br><br> -->
<!-- 		学期：<input type="radio" name="cterm" value="1">第一学期<input type="radio" name="cterm" value="2">第二学期<br><br> -->
<!-- 		<input type="submit" value="确定" /> -->
<!-- 		</sapn> -->
	</form>	

</body>
</html>