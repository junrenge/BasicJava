<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<head>
<title>客户订单管理</title>
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
<h1><a href=client_home.jsp target="_blank">客户登录</a>>>订单管理</h1>
<br>
<center>
<ul>
<li><a href=actionjsp/order.jsp?method=add target="_blank">创建订单</a></li>
<br>
<li><a href=actionjsp/order.jsp?method=show&enterprise1=   target="_blank">查询订单</a></li>
<br>
<li><a href=actionjsp/order.jsp?method=confirm&enterprise1= target="_blank">签收确认</a></li>
</ul>
</center>



</body>
</html>