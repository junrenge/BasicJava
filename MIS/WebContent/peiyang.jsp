<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	width: 80%;
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

.highlight {
	background: #d0ddc0;
}
</style>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.7.min.js"></script>
<script type="text/javascript">
	$("document").ready(function() {
		$("#grade").val($("#s1").val());
		$("#clazz").val($("#s2").val());
		$("#term").val($("#s3").val());
	});
	
// 	function writeclassonce(cid) {
// 		alert(11);
<%-- 		var url = "<%=request.getContextPath()%>/class?method=writeclassonce"; --%>
// 		var date = {
// 			"time" : new Date(),
// 			"cweekday" : $("#cweekday_"+cid).val(),
// 			"ctime" : $("#ctime_"+cid).val(),
// 			"cid" : cid,
// 		};
// 		alert($("#cweekday_"+cid).val()+"-"+$("#ctime_"+cid).val());
// 		$.post(url, date,null);
// 	}
	
// 	function aa(){
// 		alert(11);
// 	}
</script>
</head>
<body marginwidth="50px">
	<input type="hidden" value="${s1 }" id="s1">
	<input type="hidden" value="${s2 }" id="s2">
	<input type="hidden" value="${s3 }" id="s3">
	<form action="class?method=search&type=4" method="post">
		<!-- 		�γ̺ţ�<input type="text" name="cno" id="s1"> -->
		<!-- 		�γ�����<input type="text" name="cname" id="s2"> -->

		�꼶:<select id="grade" name="grade" style="font-size: 16px"
			id="select1">
			<option value="">-ѡ���꼶-</option>
			<option value="1">��һ</option>
			<option value="2">���</option>
			<option value="3">����</option>
			<option value="4">����</option>
		</select> �༶:<select id="clazz" name="clazz" style="font-size: 16px"
			id="select2">
			<option selected value="">-ѡ��༶-</option>
			<option value="1">�������ѧ</option>
			<option value="2">�������</option>
			<option value="3">��Ϣ��������Ϣϵͳ</option>
		</select> ѧ��:<select id="term" name="term" style="font-size: 16px" id="select3">
			<option selected value="">-ѡ��ѧ��-</option>
			<option value="1">��һѧ��</option>
			<option value="2">�ڶ�ѧ��</option>
		</select> <input type="submit" value="����" />
	</form>

	<table class="imagetable">
		<tr>
			<th>�γ̺�</th>
			<th>�γ���</th>
			<th>�ܼ��Ͽ�</th>
			<th>�Ͽ�ʱ��</th>
			<th>�Ͽεص�</th>
			<th>�꼶</th>
			<th>�༶</th>
			<th>ѧ��</th>
			<th>����</th>
			<th>�Ƿ������ڿ�</th>
			<th>ѧ��</th>
		</tr>
		<c:forEach var="c" items="${requestScope.classes}">
			<tr>
				<td>${c.cno }</td>
				<td>${c.cname }</td>
				<td>${c.cweekday }</td>
				<td>${c.ctime }</td>
				<td>${c.cplace }</td>
				<td>${c.cgrade }</td>
				<td>${c.cclass }</td>
				<td>${c.ccredit }</td>
				<td>${c.ctype }</td>
				<td>${c.ctag }</td>
				<td>${c.cterm }</td>
			</tr>
		</c:forEach>
	</table>
	<br>
</body>
</html>