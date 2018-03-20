<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
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
			<td width="25px"><a href="risk?method=search" target="rightFrame"><span>风险类型</span></a></td>
		</tr>
		<tr>
			<td width="25px"><a href="factor?method=search" target="rightFrame"><span>风险指标</span></a></td>
		</tr>
		<tr>
			<td width="25px"><a href="eva?method=search" target="rightFrame"><span>评价管理</span></a></td>
		</tr>
		<tr>
			<td width="25px"><a href="fahp?method=search" target="rightFrame"><span>模拟FAHP评估</span></a></td>
		</tr>
		<tr>
			<td width="25px"><a href="fahp?method=history" target="rightFrame"><span>评估历史记录</span></a></td>
		</tr>
	</table>
</body>
</html>