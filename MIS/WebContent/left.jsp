<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
span {
	font-size: 16px;
	font-family: ΢���ź�;
}
</style>
</head>
<body style="margin: 5px; background: #B9DCF0" alink="#6600CC">
	<table width="160" border="0" cellpadding="3px" cellspacing="0"
		align="left" style="margin-left: 10px; margin-top: 5px">
		<tr>
			<td width="25px"><a href="student?method=search&id=${sessionScope.id }" target="rightFrame"><span>�鿴ѧ��</span></a></td>
		</tr>
		<tr>
			<td width="25px"><a href="peiyang.jsp" target="rightFrame"><span>��������</span></a></td>
		</tr>
		<tr>
			<td width="25px"><a href="class?method=search&type=1" target="rightFrame"><span>����ѡ��</span></a></td>
		</tr>
		<tr>
			<td width="25px"><a href="chengji.jsp" target="rightFrame"><span>ѧҵ�ɼ�</span></a></td>
		</tr>
	</table>
	<div
		style="font-size: 12px;position: fixed; left: 3%; bottom: 10px; width: 400px;">
		<span>ѧ����${sessionScope.sname }</span>&nbsp;&nbsp;<span><a href="login.jsp" target="_parent">���µ�¼</a></span>
	</div>
</body>
</html>