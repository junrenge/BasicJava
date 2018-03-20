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
	$("input[name='cweekday'][value="+$("#s1").val()+"]").attr("checked",true); 
	$("input[name='ctime'][value="+$("#s2").val()+"]").attr("checked",true); 
	$("input[name='cgrade'][value="+$("#s3").val()+"]").attr("checked",true); 
	$("input[name='cclass'][value="+$("#s4").val()+"]").attr("checked",true); 
	$("input[name='ctype'][value="+$("#s5").val()+"]").attr("checked",true); 
	$("input[name='ctag'][value="+$("#s6").val()+"]").attr("checked",true); 
	$("input[name='cterm'][value="+$("#s7").val()+"]").attr("checked",true); 
});
</script>
</head>
<body marginwidth="50px">

	<input id="s1" value="${c.cweekday }" type="hidden">
	<input id="s2" value="${c.ctime }" type="hidden">
	<input id="s3" value="${c.cgrade }" type="hidden">
	<input id="s4" value="${c.cclass }" type="hidden">
	<input id="s5" value="${c.ctype }" type="hidden">
	<input id="s6" value="${c.ctag }" type="hidden">
	<input id="s7" value="${c.cterm }" type="hidden">
	
	<form action="class?method=update&id=${c.id }" method="post">
	<table class="imagetable">
		<tr>
			<th>�γ̺�</th><td><input type="text" name="cno" value="${ c.cno}"></td>
		</tr>
		<tr>
			<th>�γ���</th><td><input type="text" name="cname" value="${ c.cname}"></td>
		</tr>
		<tr>
			<th>�ܼ��Ͽ�</th><td><input type="radio" name="cweekday" value="1">��һ<input type="radio" name="cweekday" value="2">�ܶ�<input type="radio" name="cweekday" value="3">����<input type="radio" name="cweekday" value="4">����<input type="radio" name="cweekday" value="5">����</td>
		</tr>
		<tr>
			<th>�Ͽ�ʱ��</th><td><input type="radio" name="ctime" value="1">����<input type="radio" name="ctime" value="2">����</td>
		</tr>
		<tr>
			<th>�Ͽεص�</th><td><input type="text" name="cplace" value="${ c.cplace}"></td>
		</tr>
		<tr>
			<th>�꼶</th><td><input type="radio" name="cgrade" value="1">��һ<input type="radio" name="cgrade" value="2">���<input type="radio" name="cgrade" value="3">����<input type="radio" name="cgrade" value="4">����</td>
		</tr>
		<tr>
			<th>�༶</th><td><input type="radio" name="cclass" value="1">1<input type="radio" name="cclass" value="2">2<input type="radio" name="cclass" value="3">3</td>
		</tr>
		<tr>
			<th>ѧ��</th><td><input type="text" name="ccredit" value="${c.ccredit }"></td>
		</tr>
		<tr>
			<th>����</th><td><input type="radio" name="ctype" value="0">����<input type="radio" name="ctype" value="1">ѡ��</td>
		</tr>
		<tr>
			<th>�Ƿ������ڿ�</th><td><input type="radio" name="ctag" value="0">��<input type="radio" name="ctag" value="1">��</td>
		</tr>
		<tr>
			<th>ѧ��</th><td><input type="radio" name="cterm" value="1">��һѧ��<input type="radio" name="cterm" value="2">�ڶ�ѧ��</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="ȷ��" /></td>
		</tr>
	</table>
<!-- 	<sapn> -->
<%-- 		�γ̺ţ�<input type="text" name="cno" value="${ c.cno}"><br><br> --%>
<%-- 	            �γ�����<input type="text" name="cname" value="${ c.cname}"><br><br> --%>
<!-- 		�Ͽ����ڣ�<input type="radio" name="cweekday" value="1">��һ<input type="radio" name="cweekday" value="2">�ܶ�<input type="radio" name="cweekday" value="3">����<input type="radio" name="cweekday" value="4">����<input type="radio" name="cweekday" value="5">����<br><br> -->
<!-- 		�Ͽ�ʱ�䣺<input type="radio" name="ctime" value="1">����<input type="radio" name="ctime" value="2">����<br><br> -->
<%-- 		�Ͽεص㣺<input type="text" name="cplace" value="${ c.cplace}"><br><br> --%>
<!-- 		�꼶��<input type="radio" name="cgrade" value="1">��һ<input type="radio" name="cgrade" value="2">���<input type="radio" name="cgrade" value="3">����<input type="radio" name="cgrade" value="4">����<br><br> -->
<!-- 		�༶��<input type="radio" name="cclass" value="1">1<input type="radio" name="cclass" value="2">2<input type="radio" name="cclass" value="3">3<br><br> -->
<%-- 		ѧ�֣�<input type="text" name="ccredit" value="${c.ccredit }"><br><br> --%>
<!-- 		���ͣ�<input type="radio" name="ctype" value="0">����<input type="radio" name="ctype" value="1">ѡ��<br><br> -->
<!-- 		�Ƿ������ڿΣ�<input type="radio" name="ctag" value="0">��<input type="radio" name="ctag" value="1">��<br><br> -->
<!-- 		ѧ�ڣ�<input type="radio" name="cterm" value="1">��һѧ��<input type="radio" name="cterm" value="2">�ڶ�ѧ��<br><br> -->
<!-- 		<input type="submit" value="ȷ��" /> -->
<!-- 		</sapn> -->
	</form>	

</body>
</html>