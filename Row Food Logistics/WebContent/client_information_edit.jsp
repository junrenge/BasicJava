<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<head>
<title>客户信息管理</title>
<style type="text/css">
body{font-family:楷体;}
p{font-size:25px;color:grey;}
.stress{font-size:40px;color:#CE0000;}
a{color:white;}
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
<form action="/Row_Food_Logistics/actionjsp/c_info.jsp?method=update&id=${requestScope.client.id }" method="post">
<table>
<input type="hidden" value="<%=request.getParameter("id") %>">
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
		<td><input type="text" name="ename" value="${requestScope.client.enterprise_name }"></td>
		<td><input type="text" name="type" value="${requestScope.client.type }"></td>
		<td><input type="text" name="cname" value="${requestScope.client.client_name }"></td>
		<td><input type="text" name="password" value="${requestScope.client.password }"></td>
		<td><input type="text" name="phone" value="${requestScope.client.phone }"></td>
		<td><input type="text" name="email" value="${requestScope.client.email }"></td>
		<td><input type="text" name="address" value="${requestScope.client.address }"></td>
		<td><input type="text" name="cnumber" value="${requestScope.client.cnumber }"></td>
	</tr>			
	<tr>
		<td><input type="submit" value="提交"></td>
	</tr>
</table>
</form>



</body>
</html>