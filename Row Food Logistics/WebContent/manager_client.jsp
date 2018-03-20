<%@page import="com.tt.model.Client"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<head>
<title>客户管理</title>
<style type="text/css">
body{font-family:楷体;}
p{font-size:25px;color:grey;}
.stress{font-size:40px;color:#CE0000;}
a{color:white;}
h1{font-size:20px;color:white;background-color:#474747;top-height:10px;}
</style>
</head>
<body>
<center>
<p><span class="stress">宁鲜物流|</span>生鲜物流，我们更专业</p>
</center>
<!-- hr size=10 color=#474747  -->
<h1><a href=manager_home.jsp target="_blank">管理员登录</a>>>客户管理</h1>
<br><br>
<form action="/Row_Food_Logistics/actionjsp/m_client.jsp?method=search" method="post">
	<input type="text" name="cname">
	<input type="submit" value="搜索">
</form>
<table>
	<tr>
		<th>企业名称</th>
		<th>客户类型</th>
		<th>联系人姓名</th>
		<th>电话</th>
		<th>邮箱</th>
		<th>地址</th>
		<th>资格认证号码</th>
	</tr>
	<%
		ArrayList clients = (ArrayList)request.getAttribute("clients");
		for(int i=0;i<clients.size();i++){
			Client c = (Client)clients.get(i);
			%>
				<tr>
					<td><%=c.getEnterprise_name() %></td>
					<td><%=c.getType() %></td>
					<td><%=c.getClient_name() %></td>
					<td><%=c.getPhone() %></td>
					<td><%=c.getEmail() %></td>
					<td><%=c.getAddress() %></td>
					<td><%=c.getCnumber() %></td>
				</tr>
			<%
		}
	%>
</table>
</body>
</html>