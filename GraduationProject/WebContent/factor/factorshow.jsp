<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mytable.css">
</head>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.7.min.js"></script>
<script type="text/javascript">
$("document").ready(function(){ 
	var obj = $("#fids").val();
	var arr = obj.split(",");
	for (var i = 0; i < arr.length-1; i++) {
		$("#"+arr[i]).attr("checked","checked");
	}
})
</script>
<body>
<input type="hidden" value="${sessionScope.factorids }" id="fids">
	<center>
		<form action="factor?method=selectok" method="post" name="myform">
		<table class="mytable">
			<tr>
				<th style="width:35%">风险类型</th>
				<th style="width:35%">指标名称</th>
				<th style="width:15%">选择</th>
				<th>操作</th>
			</tr>
			<c:forEach var="rf" items="${requestScope.rfs}">
				<tr>
				<td>${rf.rname }</td>
				<c:if test="${rf.fid != 0 }">
					<td>${rf.fname }</td>
					<td><input type="checkbox" value="${rf.fid }" id="${rf.fid }" name="factorids"/></td>
					<td><a href="factor?method=edit&id=${rf.fid }">修改</a>&nbsp;<a href="factor?method=delete&id=${rf.fid }">删除</a></td>
				</c:if>
				</tr>
			</c:forEach>		
		</table>
		<br><br>
		<a href="factor?method=edit&id=">添加</a>&nbsp;&nbsp;<a href="javascript:myform.submit()">选择完毕</a>
		</form>
	</center>
</body>
</html>