<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<title>风险识别</title>
<style type="text/css"> 
body,table{ 
font-size:12px; 
} 
table{ 
table-layout:fixed; 
empty-cells:show; 
border-collapse: collapse; 
margin:0 auto; 
} 
td{ 
height:30px; 
} 
h1,h2,h3{ 
font-size:12px; 
margin:0; 
padding:0; 
} 
.table{ 
border:1px solid #cad9ea; 
color:#666; 
} 
.table th { 
background-repeat:repeat-x; 
height:30px; 
} 
.table td,.table th{ 
border:1px solid #cad9ea; 
padding:0 1em 0; 
} 
.table tr.alter{ 
background-color:#f5fafe; 
} 
</style>
</head>
<%@include file="head.jsp" %>
<body>
	<input type="hidden" name="innerarray" />
	<center>
	<p>请选择要评估的风险类型及其指标</p>
	<form id="form" action="select" method="post">
		<table class="table" width="60%">
			<tr><td rowspan=5 style="">内部风险</td><td>组织&nbsp;<input type="checkbox" name="inner" value="1"></td></tr>
			<tr><td>库存&nbsp;<input type="checkbox" name="inner" value="2"></td></tr>
			<tr><td>采购&nbsp;<input type="checkbox" name="inner" value="3"></td></tr>
			<tr><td>配送&nbsp;<input type="checkbox" name="inner" value="4"></td></tr>
			<tr><td>财务&nbsp;<input type="checkbox" name="inner" value="5"></td></tr>
			
			<tr><td rowspan=3>合作风险</td><td>伙伴关系&nbsp;<input type="checkbox" name="net" value="1"></td></tr>
			<tr><td>信息传递&nbsp;<input type="checkbox" name="net" value="2"></td></tr>
			<tr><td>合作范围&nbsp;<input type="checkbox" name="net" value="3"></td></tr>
			
			<tr><td rowspan=3>外部风险</td><td>政治环境&nbsp;<input type="checkbox" name="out" value="1"></td></tr>
			<tr><td>自然灾害&nbsp;<input type="checkbox" name="out" value="2"></td></tr>
			<tr><td>市场波动&nbsp;<input type="checkbox" name="out" value="3"></td></tr>
			<tr><td colspan=2 align="center"><input type="submit" value="确定"/></td></tr>
		</table>	
	</form>
	
</body>
</html>