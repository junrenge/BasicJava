<%@page import="com.tt.model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<head>
<title>订单查询</title>
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
<h1><a href=/Row_Food_Logistics/manager_home.jsp target="_blank">管理员登录</a>>><a href=/Row_Food_Logistics/manager_order.jsp target="blank">订单管理</a>>>订单查询</h1>
<br><br>
<form action="/Row_Food_Logistics/actionjsp/order.jsp?method=mgshow" method="post">
	发货企业：<input type="text" name="enterprise1">&nbsp;&nbsp;
	发货人姓名：<input type="text" name="name1">
	<input type="submit" value="搜索">
</form>
<table>
	<tr>
		<th>发货企业</th>
		<th>发货人姓名</th>
		<th>发货人电话</th>
		<th>发货人邮件</th>
		<th>发货人地址</th>
		<th>收货人姓名</th>
		<th>收货人电话</th>
		<th>收货人邮件</th>
		<th>收货人地址</th>
		<th>货物名称</th>
		<th>货物重量</th>
		<th>温度要求</th>
		<th>最长运输时间</th>
		<th>路线</th>
		<th>车辆编号</th>
		<th>状态</th>
	</tr>
	<%
		ArrayList os = (ArrayList)request.getAttribute("os");
		for(int i=0;i<os.size();i++){
			Order c = (Order)os.get(i);
			if(c.getReview().equals("1")){
			%>
				<tr>
					<td><%=c.getEnterprise1() %></td>
					<td><%=c.getName1() %></td>
					<td><%=c.getPhone1() %></td>
					<td><%=c.getEmail1() %></td>
					<td><%=c.getAddress() %></td>
					<td><%=c.getName2() %></td>
					<td><%=c.getPhone2() %></td>
					<td><%=c.getEmail2() %></td>
					<td><%=c.getAddress2() %></td>
					<td><%=c.getGoods_name() %></td>
					<td><%=c.getGoods_weight() %></td>
					<td><%=c.getGoods_tem() %></td>
					<td><%=c.getGoods_time() %></td>
					<td><%=c.getLine() %></td>
					<td><%=c.getCarname() %></td>
					<%
						if(c.getStatus().equals("1")){
							%>
							<td>在途</td>
							<%
						}else{
							%>
							<td><a href="/Row_Food_Logistics/actionjsp/order.jsp?method=status&id=<%=c.getId() %>">开始</a></td>
							<%
						}
					%>
				</tr>
			<%
			}
		}
	%>
</table>
</body>
</html>