<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>错误页面</title>
</head>
<body>
	<center>
	<%
	response.setHeader("refresh", "3;URL=login.jsp");
	%>
	用户名或密码错误!<br>
	三秒后将跳转到登录页面 ,如果没有跳转,请按 <a href="login.jsp">这里</a>
	</center>
</body>
</html>