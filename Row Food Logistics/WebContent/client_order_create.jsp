<%@page import="com.tt.model.Line"%>
<%@page import="com.tt.model.Goods"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<head>
<title>创建订单</title>
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
<h1><a href=/Row_Food_Logistics/client_home.jsp target="_blank">客户登录</a><a href=/Row_Food_Logistics/client_order.jsp target="_blank">>>订单管理</a>>>创建订单</h1>
<br><br>
<form action="/Row_Food_Logistics/actionjsp/order.jsp?method=update&id=&cid=<%=session.getAttribute("cid") %>" method="post">
<table>
	<tr>
		<td>收货人</td><td><input type="text" name="name2"></td>
	</tr>
	<tr>
		<td>收货人联系方式</td><td><input type="text" name="phone2"></td>
	</tr>
	<tr>
		<td>收货人邮箱地址</td><td><input type="text" name="email2"></td>
	</tr>
	<tr>
		<td>收货地址</td><td><input type="text" name="address2"></td>
	</tr>
	<tr>
		<td>货物名称</td><td><select name="goods_name">
							<%
								ArrayList goods = (ArrayList)request.getAttribute("goods");
								for(int i=0;i<goods.size();i++){
									Goods g = (Goods)goods.get(i);
									%>
										<option><%=g.getName() %></option>
									<%
								}
							%>
						   </select></td>
	</tr>
	<tr>
		<td>货物重量</td><td><input type="text" name="goods_weight"></td>
	</tr>
	<tr>
		<td>货物存放温度</td><td><select name="goods_tem">
								<option>D</option>
								<option>E</option>
								<option>F</option>
							  </td>
	</tr>
	<tr>
		<td>货物最长运输期</td><td><input type="text" name="goods_time"></td>
	</tr>
	<tr>
		<td>运输线路</td><td><select name="line">
							<%
								ArrayList lines = (ArrayList)request.getAttribute("lines");
								for(int i=0;i<lines.size();i++){
									Line g = (Line)lines.get(i);
									%>
										<option><%=g.getLines() %></option>
									<%
								}
							%>
						   </select></td>
	</tr>
	<tr>
		<td><input type="submit" value="提交订单"></td>
	</tr>
</table>
</form>
</body>
</html>