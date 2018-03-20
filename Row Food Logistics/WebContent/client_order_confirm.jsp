<%@page import="com.tt.model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<head>
<title>签收确认</title>
<style type="text/css">
body{font-family:楷体;}
p{font-size:25px;color:grey;}
.stress{font-size:40px;color:#CE0000;}
a{color:black;}
h1{font-size:20px;color:white;background-color:#474747;top-height:10px;}
</style>
</head>
<body>
<center>
<p><span class="stress">宁鲜物流|</span>生鲜物流，我们更专业</p>
</center>
<!-- hr size=10 color=#474747  -->
<h1><a href=/Row_Food_Logistics/client_home.jsp target="_blank">客户登录</a><a href=/Row_Food_Logistics/client_order.jsp target="_blank">>>订单管理</a>>>签收确认</h1>
<br><br>
<form action="/Row_Food_Logistics/actionjsp/order.jsp?method=search" method="post">
	发货企业：<input type="text" name="enterprise1">&nbsp;&nbsp;
	<input type="submit" value="搜索">
</form>
<table style="float:left;width:45%">
	<tr>
		<th>发货企业</th>
		<th>发货人姓名</th>
		<th>制冷设备</th>
		<th>载重</th>
		<th>闲置数量</th>
		<th>装车标准</th>
		<th>签收确认</th>
	</tr>
	<%
		ArrayList os = (ArrayList)request.getAttribute("os");
		for(int i=0;i<os.size();i++){
			Order c = (Order)os.get(i);
			if(c.getReceive().equals("0")){
			%>
				<tr>
					<td><%=c.getEnterprise1() %></td>
					<td><%=c.getName1() %></td>
					<td><%=c.getName1() %></td>
					<td><%=c.getName1() %></td>
					<td><%=c.getName1() %></td>
					<td><%=c.getName1() %></td>
					<td><a href="/Row_Food_Logistics/actionjsp/order.jsp?method=receive&id=<%=c.getId() %>">点击签收</a></td>
				</tr>
			<%
			}
		}
	%>
</table>

<table style="float:left;width:45%; padding-left:30px">
	<tr>
		<th>发货企业</th>
		<th>发货人姓名</th>
		<th>制冷设备</th>
		<th>载重</th>
		<th>闲置数量</th>
		<th>装车标准</th>
		<th>签收确认</th>
	</tr>
	<%
		for(int i=0;i<os.size();i++){
			Order c = (Order)os.get(i);
			if(c.getReceive().equals("1")){
			%>
				<tr>
					<td><%=c.getEnterprise1() %></td>
					<td><%=c.getName1() %></td>
					<td><%=c.getName1() %></td>
					<td><%=c.getName1() %></td>
					<td><%=c.getName1() %></td>
					<td><%=c.getName1() %></td>
					<td>已签收</td>
				</tr>
			<%
			}
		}
	%>
</table>
</body>
</html>