<%@ page language="java" contentType="text/html; charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>订单管理</title>
<style type="text/css">
body{font-family:楷体;}
p{font-size:25px;color:grey;}
.stress{font-size:40px;color:#CE0000;}
a{color:white;}
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
<!-- hr size=10 color=#474747  -->
<h1><a href=manager_home.jsp target="_blank">管理员登录</a>>>订单管理</h1>
<br>
<center>
<ul>
<li><a href=/Row_Food_Logistics/actionjsp/order.jsp?method=mrshow&enterprise1=&name1= target="_blank">订单审核</a></li>
<br>
<li><a href=/Row_Food_Logistics/actionjsp/order.jsp?method=mcreshow&enterprise1=&name1= target="_blank">创建物流规划</a></li>
<br>
<li><a href=/Row_Food_Logistics/actionjsp/order.jsp?method=mshow&enterprise1=&name1= target="_blank">订单查询</a></li>
<br>
<li><a href=/Row_Food_Logistics/actionjsp/order.jsp?method=mgshow&enterprise1=&name1= target="_blank">货物/订单状态</a></li>
<br>
<li><a href=/Row_Food_Logistics/actionjsp/order.jsp?method=mcshow&enterprise1=&name1= target="_blank">回单确认</a></li>
</ul>
</center>



</body>
</html>