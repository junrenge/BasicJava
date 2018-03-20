<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	来晚一步,没有库存图书了！,欢迎选购其他图书
		<a href ="page?jumpPage=<%=request.getParameter("pageNo") %>">继续购物</a>

</body>
</html>