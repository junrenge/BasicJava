<%@page import="com.tt.model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<head>
<title>������ѯ</title>
<style type="text/css">
body{font-family:����;}
p{font-size:25px;color:grey;}
.stress{font-size:40px;color:#CE0000;}
a{color:black;}
h1{font-size:20px;color:white;background-color:#474747;top-height:10px;}
</style>
</head>
<body>
<center>
<p><span class="stress">��������|</span>�������������Ǹ�רҵ</p>
</center>
<!-- hr size=10 color=#474747  -->
<h1><a href=/Row_Food_Logistics/manager_home.jsp target="_blank">����Ա��¼</a>>><a href=/Row_Food_Logistics/manager_order.jsp target="blank">��������</a>>>������ѯ</h1>
<br><br>
<form action="/Row_Food_Logistics/actionjsp/order.jsp?method=mgshow" method="post">
	������ҵ��<input type="text" name="enterprise1">&nbsp;&nbsp;
	������������<input type="text" name="name1">
	<input type="submit" value="����">
</form>
<table>
	<tr>
		<th>������ҵ</th>
		<th>����������</th>
		<th>�����˵绰</th>
		<th>�������ʼ�</th>
		<th>�����˵�ַ</th>
		<th>�ջ�������</th>
		<th>�ջ��˵绰</th>
		<th>�ջ����ʼ�</th>
		<th>�ջ��˵�ַ</th>
		<th>��������</th>
		<th>��������</th>
		<th>�¶�Ҫ��</th>
		<th>�����ʱ��</th>
		<th>·��</th>
		<th>�������</th>
		<th>״̬</th>
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
							<td>��;</td>
							<%
						}else{
							%>
							<td><a href="/Row_Food_Logistics/actionjsp/order.jsp?method=status&id=<%=c.getId() %>">��ʼ</a></td>
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