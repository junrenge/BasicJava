<%@ page language="java" contentType="text/html;charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>¿Í»§Ö÷Ò³</title>
<style type="text/css">
body{font-family:¿¬Ìå;}
p{font-size:25px;color:grey;}
.stress{font-size:40px;color:#CE0000;}
h1{font-size:20px;color:white;background-color:#474747;top-height:10px;}
li{list-style:none;text-align:center;font-family:¿¬Ìå;font-size:30px;}
a{color:white;background-color:#474747;} <!--#CE0000 maroon  -->
a:visited{color:white;background-color:#474747;}
a:active{color:white;background-color:#474747;}
a:hover{color:#CE0000;background-color:#474747;}
</style>
</head>
<body>
<center>
<p><span class="stress">ÄþÏÊÎïÁ÷|</span>ÉúÏÊÎïÁ÷£¬ÎÒÃÇ¸ü×¨Òµ</p>
</center>
<h1>¿Í»§µÇÂ¼</h1>
<br>
<center>
<ul>
<li><a href=/Row_Food_Logistics/actionjsp/c_info.jsp?method=show&id=<%=session.getAttribute("cid") %> target="_blank">ÐÅÏ¢¹ÜÀí</a></li>
<br>
<li><a href=/Row_Food_Logistics/client_order.jsp target="_blank">¶©µ¥¹ÜÀí</a></li>
</ul>
</center>
</body>
</html>