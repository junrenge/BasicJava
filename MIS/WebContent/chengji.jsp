<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>�ɼ��鿴</title>
<style type="text/css">
table.imagetable {
	font-family: verdana, arial, sans-serif;
	font-size: 11px;
	color: #333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
	width: 60%;
}

table.imagetable th {
	background: #b5cfd2 url('blue.jpg');
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
}

table.imagetable td {
	background: #dcddc0 url('grey.jpg');
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
}
</style>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.7.min.js"></script>
<script type="text/javascript">
$("document").ready(function(){ 
	$("#grade").val($("#s1").val());
	$("#term").val($("#s3").val());
});
</script>
</head>
<body marginwidth="50px">

	<input type="hidden" value="${s1 }" id="s1">
	<input type="hidden" value="${s3 }" id="s3">
	<form action="sc?method=searchmyclass" method="post">
		ѧ��:<select id="grade" name="grade" style="font-size: 16px">
                  			 <option>-ѡ���꼶-</option>
                  			 <option value="1">��һ</option>
                			 <option value="2">���</option>
                 			 <option value="3">����</option>
                 			 <option value="4">����</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;
		ѧ��:<select id="term" name="term" style="font-size: 16px">
                  			 <option>-ѡ��ѧ��-</option>
                  			 <option value="1">��һѧ��</option>
                			 <option value="2">�ڶ�ѧ��</option>
        </select>
		<input type="submit" value="����" />
	</form>	

	<span>ѧ�ţ�${sessionScope.sno }</span>&nbsp;&nbsp;&nbsp;<span>������${sessionScope.sname }</span>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span>GPA(��׼�㷨):
		<c:if test="${requestScope.gpa != '0'}">
			${requestScope.gpa }
		</c:if>
	</span>
	<br><br>
	<table class="imagetable">
		<tr>
			<th>�γ̺�</th>
			<th>�γ���</th>
			<th>�ɼ�</th>
			<th>ѧ��</th>
			<th>����</th>
			<th>ѧ�ּ���</th>
		</tr>
		<c:forEach var="c" items="${requestScope.list}" >
		  <tr>
   			<td>${c.cno }</td>
   			<td>${c.cname }</td>
   			<td>${c.grade }</td>
   			<td>${c.credit }</td>
   			<td>${c.jidian}</td>
   			<td>${c.cj }</td>
          </tr>
		</c:forEach>
	</table>
</body>
</html>