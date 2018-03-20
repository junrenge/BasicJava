<%@ page contentType="text/html;charset=gb2312"%>
<html>
<head>
<title>登录</title>
<style type="text/css">
	.content{
		width: 400px;
		height: 5px;
		margin-top: 150px;
		font-size: 25px;
		font-family: 微软雅黑;
	}
	
	.title{
		margin-bottom: 50px;
	}
</style>
</head>
<body background="fruit.jpg">
<center>
	<div class="content">
	<h1 class = "title">欢迎光临有家书店</h1>
	<form action="login_check.jsp">
	<table>
		<tr>
			<td>用户名：</td>
			<td><input type="text" name="username" /></td>
		</tr>
		<tr>
			<td>密码：</td>
			<td><input type="password" name="password" /></td>
		</tr>
		<tr>
		<td></td>
			<td align="center"><input type="submit" value="登录"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"/></td>
		</tr>
	</table>
	</form>
		<%
			String msg = request.getParameter("msg");
			if(msg != null || "".equals(msg)){
				out.print("登录有误");
			}
		%>
	</div>
	</center>
</body>
</html>