<%@page import="com.junrenge.util.StringCut"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mytable.css">
<style type="text/css">
input{
	border:0;
	align:center;
	width:100%;
	height:100%;
}

table.mytable th {
	background: #b5cfd2 url('blue.jpg');
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
	width: 20px
}
</style>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.7.min.js"></script>
<script type="text/javascript">
	$("document").ready(function(){ 
	})
</script>
</head>
<body>
	<center>
	<form action="fahp?method=calover" method="post" name="myform">
		<%
			String [][] arr = (String[][])session.getAttribute("arr");
			double [][] wei = (double[][])session.getAttribute("weights");
			double [][] v = (double[][])session.getAttribute("v");
			double [] result = (double [])session.getAttribute("result");
			int j = 0;
			for(int i=0;i<arr.length;i++){
				%>
			<table class="mytable">
				<tr>
					<th>��Ŀ</th>
					<td>
						<%
							for(j=0;j<arr[i].length;j++){
								out.print(arr[i][j]+" ");
							}
						%>
					</td>
				</tr>
				<tr>
					<th>Ȩ��</th>
					<td>
						<%
							for(j=0;j<wei[i].length;j++){
								out.print(StringCut.cut(wei[i][j]+"")+" ");
							}
						%>
					</td>
				</tr>
				<tr>
					<th>��������</th>
					<td>
						<%	
							if(i != 0){
								for(j=0;j<v[i].length;j++){
									out.print(StringCut.cut(v[i][j]+"")+" ");
								}
							}else{
								out.print("---");
							}
						%>
					</td>
				</tr>
				<tr>
					<th>�÷�</th>
					<td>
						<%
							out.print(StringCut.cut(result[i]+""));
						%>
					</td>
				</tr>
			</table>
			<br><br>
				<%
			}
		%>
		
		<table class="mytable"  style="width:50%; text-align:center">
		<tr>
			<th>����ֵ</th>
			<th>�ȼ�</th>
		</tr>
		<tr>
			<td>X��3.5</td>
			<td>��</td>
		</tr>
		<tr>
			<td>2.5��X��3.5</td>
			<td>��</td>
		</tr>
		<tr>
			<td>1.5��X��2.5</td>
			<td>��</td>
		</tr>
		<tr>
			<td>X��1.5</td>
			<td>�ܸ�</td>
		</tr>
	</table>
		
		<a href="javascript:myform.submit()">������ҳ</a>
	</form>
	</center>
</body>
</html>