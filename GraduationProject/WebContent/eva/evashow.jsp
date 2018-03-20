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
	var obj = $("#evaid").val();
	$("#"+obj).attr("checked","checked");
})
</script>
<body>
<input type="hidden" value="${sessionScope.evaid }" id="evaid">
	<center>
		<form action="eva?method=selectok" method="post" name="myform">
		<table class="mytable">
			<tr>
				<th style="width : 35%">�����Ｏ</th>
				<th style="width : 35%">���۷�����</th>
				<th style="width : 15%">ѡ��</th>
				<th>����</th>
			</tr>
			
			<c:forEach var="e" items="${requestScope.evas}">
			 <tr>
				<td>{${e.names }}</td>
				<td>{${e.credits }}</td>
				<td><input type="radio" name="evaid" value="${e.id }" id="${e.id }"/></td>
				<td><a href="eva?method=edit&id=${e.id }">�޸�</a>&nbsp;<a href="eva?method=delete&id=${e.id }">ɾ��</a></td>
			 </tr>
			</c:forEach>
		</table>
		</form>
		<br><br>
		<a href="eva?method=edit&id=">���</a>&nbsp;&nbsp;<a href="javascript:myform.submit()">ѡ�����</a>
	</center>
</body>
</html>