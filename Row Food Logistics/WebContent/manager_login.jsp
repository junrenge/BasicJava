<%@ page language="java" contentType="text/html;charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>员工访问</title>
<style type="text/css">
body{font-family:楷体;}
p{font-size:25px;color:grey;}
.stress{font-size:40px;color:#CE0000;}
h1{font-size:20px;color:white;background-color:#474747;top-height:10px;}
form{font-size:25px;color:#282828;}
</style>
</head>
<body>
<center>
<p><span class="stress">宁鲜物流|</span>生鲜物流，我们更专业</p>
</center>
<!-- hr size=10 color=#474747  -->
<h1>管理员登录</h1>
<br><br><br>
<center>
<form action="/Row_Food_Logistics/actionjsp/m_login.jsp" method="post" >
<table width:400 border=3 width=350px height=180 align=center bordercolor=#474747 rules=none >
<tr>
<td>用户：<input name="name" style="border:#474747 2 solid;height:20px;width:200px;" type="text" value="manager_name"><br>
</td></tr>
<tr>
<td>密码：<input name="password" style="border:#474747 2 solid;height:20px;width:200px;" type="password"><br>
</td></tr>
<tr>
<td><input type="submit" value="登陆" style="border:#474747 1 solid; height:20px width:5px" bgcolor:grey> 
</td></tr>
</table>
</form>

</center>

</body>
</html>