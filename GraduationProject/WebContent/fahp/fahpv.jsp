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
	<form action="fahp?method=calv" method="post" name="myform">
		<%
			String [][] arr = (String[][])session.getAttribute("arr");
			double [][] wei = (double[][])session.getAttribute("weights");
			String [] names = (String[])request.getAttribute("names");
			String [][][] evam = (String[][][])request.getAttribute("evam");
			int flag = 0;
			if(session.getAttribute("type") != null){
				flag = 1;
			}
			for(int i=1;i<arr.length;i++){
				%>
			<table class="mytable">
				<%
				//只显示因素的矩阵，类型的矩阵不显示
				for(int j=0;j<=arr[i].length;j++){
					%>
						<tr>
					<%
					for(int k=0;k<=names.length;k++){
						if(j == 0 && k != 0 ){
						%>
							<td style="readOnly:true; background-color:#BFEFFF"><%=names[k-1] %></td>
						<%
						}else if(j != 0 && k == 0 ){
						%>
							<td style="readOnly:true; background-color:#BFEFFF"><%=arr[i][j-1] %></td>
						<%
						}else if(j==0 && k==0){
						%>
							<td style="readOnly:true; background-color:#BFEFFF"><%=i+1 %></td>
						<%
						}else if(flag == 0){
						%>
							<td><input type="text" name=<%=""+(i+1)+j+k %> value=<%=""+(i+1)+j+k %>></td>
						<%
						}else{
						%>
							<td><input type="text" name=<%=""+(i+1)+j+k %> value=<%=evam[i-1][j-1][k-1] %>></td>
						<%
						}
					}
					%>
						</tr>
					<%
				}
				%>
			</table>
			<br><br>
				<%
			}
		%>
		
		<a href="javascript:myform.submit()">下一步</a>
		<%
			if(flag == 0){
				%>
			&nbsp;&nbsp;<a href="factor?method=search">重新选择</a>
				<%
			}
		%>
	</form>
	</center>
</body>
</html>