<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<head>
<title>客户信息管理</title>
<style type="text/css">
body{font-family:楷体;}
p{font-size:25px;color:grey;}
.stress{font-size:40px;color:#CE0000;}
a{color:black;}
h1{font-size:20px;color:white;background-color:#474747;top-height:10px;}
</style>
</head>
<body>
<center>
<p><span class="stress">宁鲜物流|</span>生鲜物流，我们更专业</p>
</center>
<!-- hr size=10 color=#474747  -->
<h1><a href=client_home.jsp target="_blank">客户登录</a>>>信息管理</h1>
<br><br>
<table>
	<tr>
		<th>企业名称</th>
		<th>企业类型</th>
		<th>联系人姓名</th>
		<th>密码</th>
		<th>电话</th>
		<th>邮箱</th>
		<th>地址</th>
		<th>认证序列号</th>
	</tr>
	<tr>
		<td>${requestScope.client.enterprise_name }</td>
		<td>${requestScope.client.type }</td>
		<td>${requestScope.client.client_name }</td>
		<td>${requestScope.client.password }</td>
		<td>${requestScope.client.phone }</td>
		<td>${requestScope.client.email }</td>
		<td>${requestScope.client.address }</td>
		<td>${requestScope.client.cnumber }</td>
	</tr>			
	<tr>
		<td><a href="/Row_Food_Logistics/actionjsp/c_info.jsp?method=edit&id=${requestScope.client.id }">修改</a></td>
	</tr>
</table>
</body>
</html>