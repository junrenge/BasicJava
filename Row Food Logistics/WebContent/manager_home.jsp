<%@ page language="java" contentType="text/html;charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>管理员主页</title>
<style type="text/css">
body{font-family:楷体;}
p{font-size:25px;color:grey;}
.stress{font-size:40px;color:#CE0000;}
h1{font-size:20px;color:white;background-color:#474747;top-height:10px;}
li{list-style:none;text-align:center;font-family:楷体;font-size:30px;}
a{color:white;background-color:#474747;} <!--#CE0000 maroon  -->
a:visited{color:white;background-color:#474747;}
a:active{color:white;background-color:#474747;}
a:hover{color:#CE0000;background-color:#474747;}
</style>
</head>
<body>
<center>
<p><span class="stress">宁鲜物流|</span>生鲜物流，我们更专业</p>
</center>
<h1>管理员登录</h1>
<br>
<center>
<ul>
<li><a href=/Row_Food_Logistics/actionjsp/m_client.jsp?method=search&cname= target="_blank">客户管理</a></li>
<br>
<li><a href=/Row_Food_Logistics/manager_order.jsp target="_blank">订单管理</a></li>
<br>
<li><a href=/Row_Food_Logistics/actionjsp/m_goods.jsp?method= target="_blank">货物管理</a></li>
<br>
<li><a href=/Row_Food_Logistics/actionjsp/m_car.jsp?method=&carname=&type= target="_blank">运输设备管理</a></li>
<br>
<li><a href=/Row_Food_Logistics/actionjsp/m_line.jsp?method= target="_blank">运输专线管理</a></li>
</ul>
</center>
</body>
</html>