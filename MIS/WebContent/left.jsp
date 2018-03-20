<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
span {
	font-size: 16px;
	font-family: 微软雅黑;
}
</style>
</head>
<body style="margin: 5px; background: #B9DCF0" alink="#6600CC">
	<table width="160" border="0" cellpadding="3px" cellspacing="0"
		align="left" style="margin-left: 10px; margin-top: 5px">
		<tr>
			<td width="25px"><a href="student?method=search&id=${sessionScope.id }" target="rightFrame"><span>查看学籍</span></a></td>
		</tr>
		<tr>
			<td width="25px"><a href="peiyang.jsp" target="rightFrame"><span>培养方案</span></a></td>
		</tr>
		<tr>
			<td width="25px"><a href="class?method=search&type=1" target="rightFrame"><span>网上选课</span></a></td>
		</tr>
		<tr>
			<td width="25px"><a href="chengji.jsp" target="rightFrame"><span>学业成绩</span></a></td>
		</tr>
	</table>
	<div
		style="font-size: 12px;position: fixed; left: 3%; bottom: 10px; width: 400px;">
		<span>学生：${sessionScope.sname }</span>&nbsp;&nbsp;<span><a href="login.jsp" target="_parent">重新登录</a></span>
	</div>
</body>
</html>