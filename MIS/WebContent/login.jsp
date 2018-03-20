<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="com.junrenge.util.TokenProcessor"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>登录</title>
<style type="text/css">
	.content{
		width: 400px;
		height: 5px;
		margin-top: 150px;
		font-size: 20px;
		font-family: 微软雅黑;
	}
	
	.title{
		margin-bottom: 50px;
	}
</style>
</head>
<body background="">
<center>
	<marquee scrollAmount="10" width="n" height="n" direction="type"
		scrollDelay="n" behavior="type" loop="n" onmouseover="this.stop()" 
		onmouseout="this.start()">
		<a style="color: CC6600">热烈庆祝我勇卫冕成功!</a>
	</marquee>
	<marquee scrollAmount="10" width="n" height="n" direction="type"
		scrollDelay="n" behavior="type" loop="n" onmouseover="this.stop()"
		onmouseout="this.start()">
		<a style="color: CC6600">热烈庆祝库里全票蝉联常规赛mvp，515发来贺电!</a>
	</marquee>
	<marquee scrollAmount="10" width="n" height="n" direction="type"
		scrollDelay="n" behavior="type" loop="n" onmouseover="this.stop()"
		onmouseout="this.start()">
		<a style="color: CC6600">热烈庆祝五黄成功获得五连亚!</a>
	</marquee>
	<div class="content">
	<h1 class = "title">欢迎登陆教务管理系统</h1>
	<h5>${message }</h5>
	<form action="login" method="post">
	<table>
		<tr>
			<td>用户名：</td>
			<td><input type="text" name="username" /></td>
		</tr>
		<tr>
			<td>密&nbsp;&nbsp;&nbsp;码：</td>
			<td><input type="password" name="password" /></td>
		</tr>
		<tr>
			<td>验证码：</td>
			<td><input name="CHECK_CODE_KEY_NAME" type="text" /></td>
			<td><img src="<%=request.getContextPath() %>/vc"></td>
		</tr>
		<tr>
		<td></td>
			<td align="center"><input type="submit" value="登录"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"/></td>
		</tr>
	</table>
	</form>
	</div>
	</center>
</body>
</html>