<%@ page language="java" contentType="text/html; charset=gb2312" pageEncoding="gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mytable.css">
<html>
<head>
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
function isNum() {
	alert(1);
	var Letters = "123456789"; 
	var mip = $("input[name$='credits']");
	var strs = new Array();
	strs = mip.val().toString().split(/[,，]/);
	var rs = false;
	for (i=0;i<strs.length ;i++ ){ 
	  if(strs[i] != ""){
	    if (Letters.indexOf( strs[i] ) != -1){ 
	      rs = true;
	　　 }else{
		  rs = false;
	　　 }  
	  }
	} 
	if(rs){
	  $("#myform").submit(); 
	}else{
		alert("评价分数集只能是1-9的整数");
	}
}
</script>
</head>
<body>
	<center>
	<input type="text" name="00" style="width:20px; height:10" />
	<form action="eva?method=save&id=${requestScope.eva.id }" method="post" id="myform">
		<table class="mytable">
			<tr>
				<td>评价语集：</td>
				<td><input type="text" name="names" value="${requestScope.eva.names }"></td>
			</tr>
			<tr>
				<td>评价分数集：</td>
				<td><input type="text" name="credits" id="credits" value="${requestScope.eva.credits }"></td>
			</tr>
			<tr><td colspan="2"><input type="button" value="确定" style="width:15%" onclick="isNum()"></td></tr>
		</table>
		<br><br>
	</form>
	</center>
</body>
</html>