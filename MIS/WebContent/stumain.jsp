<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<head>
<title>学生管理</title>
</head>
	<frameset rows="130,*" frameborder="no" border="0" framespacing="0">
		<frame src="head.jsp" name="topFrame" scrolling="no" noresize="noresize">
		<frameset cols="200,*" frameborder="no" border="0" framespacing="0">
			<frame src="left.jsp" name="leftFrame" scrolling="no" noresize="noresize">
			<frame src="student?method=search&id=${sessionScope.id }" name="rightFrame">
		</frameset>
	</frameset>
</html>