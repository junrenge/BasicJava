<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="com.junrenge.util.TokenProcessor"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>��¼</title>
<style type="text/css">
	.content{
		width: 400px;
		height: 5px;
		margin-top: 150px;
		font-size: 20px;
		font-family: ΢���ź�;
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
		<a style="color: CC6600">������ף��������ɹ�!</a>
	</marquee>
	<marquee scrollAmount="10" width="n" height="n" direction="type"
		scrollDelay="n" behavior="type" loop="n" onmouseover="this.stop()"
		onmouseout="this.start()">
		<a style="color: CC6600">������ף����ȫƱ����������mvp��515�����ص�!</a>
	</marquee>
	<marquee scrollAmount="10" width="n" height="n" direction="type"
		scrollDelay="n" behavior="type" loop="n" onmouseover="this.stop()"
		onmouseout="this.start()">
		<a style="color: CC6600">������ף��Ƴɹ����������!</a>
	</marquee>
	<div class="content">
	<h1 class = "title">��ӭ��½�������ϵͳ</h1>
	<h5>${message }</h5>
	<form action="login" method="post">
	<table>
		<tr>
			<td>�û�����</td>
			<td><input type="text" name="username" /></td>
		</tr>
		<tr>
			<td>��&nbsp;&nbsp;&nbsp;�룺</td>
			<td><input type="password" name="password" /></td>
		</tr>
		<tr>
			<td>��֤�룺</td>
			<td><input name="CHECK_CODE_KEY_NAME" type="text" /></td>
			<td><img src="<%=request.getContextPath() %>/vc"></td>
		</tr>
		<tr>
		<td></td>
			<td align="center"><input type="submit" value="��¼"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="����"/></td>
		</tr>
	</table>
	</form>
	</div>
	</center>
</body>
</html>