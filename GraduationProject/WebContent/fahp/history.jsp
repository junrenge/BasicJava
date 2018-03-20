<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mytable.css">
</head>
<body>
	<center>
		<table class="mytable" style="width: 95%">
			<tr>
				<th width="10%">id</th>
				<th width="50%">ѡ����Ϣ</th>
				<th width="20%">������</th>
				<th width="20%">����</th>
			</tr>
			
			<c:forEach var="f" items="${requestScope.fahps}">
			 <tr>
				<td>${f.id }</td>
				<td>${f.arr }</td>
				<td>${f.result }</td>
				<td><a href="fahp?method=recal&id=${f.id }">���¼���</a>&nbsp;<a href="fahp?method=delete&id=${f.id }">ɾ��</a></td>
			 </tr>
			</c:forEach>
		</table>
	</center>
</body>
</html>