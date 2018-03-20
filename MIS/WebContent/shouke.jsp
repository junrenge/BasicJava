<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>ѡ���ڿ�</title>
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
	$("#clazz").val($("#s2").val());
});
</script>
</head>
<body marginwidth="50px">

	<input type="hidden" value="${s1 }" id="s1">
	<input type="hidden" value="${s2 }" id="s2">
	<form action="class?method=search&type=2" method="post">
		�꼶:<select id="grade" name="grade" style="font-size: 16px">
                  			 <option>-ѡ���꼶-</option>
                  			 <option value="1">��һ</option>
                			 <option value="2">���</option>
                 			 <option value="3">����</option>
                 			 <option value="4">����</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;
		�༶:<select id="clazz" name="clazz" style="font-size: 16px">
                  			 <option>-ѡ��༶-</option>
                  			 <option value="1">�������ѧ</option>
                			 <option value="2">�������</option>
                 			 <option value="3">��Ϣ��������Ϣϵͳ</option>
        </select>
		<input type="submit" value="����" />
	</form>	

	<form action="class?method=select&type=1" method="post">
	<table class="imagetable">
		<tr>
			<th>�γ̺�</th>
			<th>�γ���</th>
			<th>�Ͽ�����</th>
			<th>�Ͽ�ʱ��</th>
			<th>�Ͽεص�</th>
			<th>ѧ��</th>
			<th>ѡ���ڿ�</th>
		</tr>
		<c:forEach var="c" items="${requestScope.classes}">
		  <tr>
   			<td>${c.cno }</td>
   			<td>${c.cname }</td>
   			<td>${c.cweekday }</td>
   			<td>${c.ctime }</td>
   			<td>${c.cplace }</td>
   			<td>${c.cterm }</td>
   			<td><input type="checkbox" name="selectedclass" value="${c.cno }"></td>
          </tr>
		</c:forEach>
	</table>
	<br>
	<input type="submit" value="ȷ��"/>
	</form>

</body>
</html>