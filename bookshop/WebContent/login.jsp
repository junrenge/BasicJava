<%@ page contentType="text/html;charset=gb2312"%>
<html>
<head>
<title>��¼</title>
<style type="text/css">
	.content{
		width: 400px;
		height: 5px;
		margin-top: 150px;
		font-size: 25px;
		font-family: ΢���ź�;
	}
	
	.title{
		margin-bottom: 50px;
	}
</style>
</head>
<body background="fruit.jpg">
<center>
	<div class="content">
	<h1 class = "title">��ӭ�����м����</h1>
	<form action="login_check.jsp">
	<table>
		<tr>
			<td>�û�����</td>
			<td><input type="text" name="username" /></td>
		</tr>
		<tr>
			<td>���룺</td>
			<td><input type="password" name="password" /></td>
		</tr>
		<tr>
		<td></td>
			<td align="center"><input type="submit" value="��¼"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="����"/></td>
		</tr>
	</table>
	</form>
		<%
			String msg = request.getParameter("msg");
			if(msg != null || "".equals(msg)){
				out.print("��¼����");
			}
		%>
	</div>
	</center>
</body>
</html>