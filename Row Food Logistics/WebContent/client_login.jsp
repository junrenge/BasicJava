<%@ page language="java" contentType="text/html;charset=gb2312"%>
<html>
<head>
<title>�ͻ�����</title>
<style type="text/css">
body{font-family:����;}
p{font-size:25px;color:grey;}
.stress{font-size:40px;color:#CE0000;}
h1{font-size:20px;color:white;background-color:#474747;top-height:10px;}
form{font-size:25px;color:#282828;}
</style>
</head>
<body>
<center>
<p><span class="stress">��������|</span>�������������Ǹ�רҵ</p>
</center>
<!-- hr size=10 color=#474747  -->
<h1>�ͻ���¼</h1>
<br><br><br>
<center>
<form action="/Row_Food_Logistics/actionjsp/c_login.jsp" method="post">
<table width:400 border=3 width=350px height=180 align=center bordercolor=#474747 rules=none >
<tr>
<td>�û���<input name="name" style="border:#474747 2 solid;height:20px;width:200px;" type="text" value="manager_name"><br>
</td></tr>
<tr>
<td>���룺<input name="password" style="border:#474747 2 solid;height:20px;width:200px;" type="password"><br>
</td></tr>
<tr>
<td><input type="submit" value="��½" style="border:#474747 1 solid; height:20px width:5px" bgcolor:grey> 
&nbsp;<a href="/Row_Food_Logistics/actionjsp/c_info.jsp?method=edit&id="><input type="button" value="ע��"></a>
</td></tr>
</table>
</form>

</center>

</body>
</html>