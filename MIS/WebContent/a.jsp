<%@page import="com.junrenge.util.TokenProcessor"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h3>aaa page</h3>
	<%
		String tokenValue = new Date().getTime()+"";
		session.setAttribute("token", tokenValue);
	%>
	<%=session.getAttribute("message") == null ? "":session.getAttribute("message") %>	
	<form action="<%=request.getContextPath() %>/checkServlet" method="post">
		<input type="hidden" name="COM.ATGUIGU.TOKEN_KEY" 
			value=<%= TokenProcessor.getInstance().saveToken(request)  %> />
		name:<input name="name" type="text"><br>
		check:<input name="CHECK_CODE_KEY_NAME" type="text" /><br>
		<img src="<%=request.getContextPath() %>/validateColorServlet">
		<input type="submit" value="Submit">
	</form>
</body>
</html>