<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<head>
<title>�ͻ���������</title>
<style type="text/css">
body{font-family:����;}
p{font-size:25px;color:grey;}
.stress{font-size:40px;color:#CE0000;}
a{color:white;}
h1{font-size:20px;color:white;background-color:#474747;top-height:10px;}
li{list-style:none;text-align:center;font-family:����;font-size:30px;}
a{color:white;background-color:#474747;} <!--#CE0000 maroon  -->
a:visited{color:white;background-color:#474747;}
a:active{color:white;background-color:#474747;}
a:hover{color:#CE0000;background-color:#474747;}
</style>
</head>
<body>
<center>
<p><span class="stress">��������|</span>�������������Ǹ�רҵ</p>
</center>
<!-- hr size=10 color=#474747  -->
<h1><a href=client_home.jsp target="_blank">�ͻ���¼</a>>>��������</h1>
<br>
<center>
<ul>
<li><a href=actionjsp/order.jsp?method=add target="_blank">��������</a></li>
<br>
<li><a href=actionjsp/order.jsp?method=show&enterprise1=   target="_blank">��ѯ����</a></li>
<br>
<li><a href=actionjsp/order.jsp?method=confirm&enterprise1= target="_blank">ǩ��ȷ��</a></li>
</ul>
</center>



</body>
</html>