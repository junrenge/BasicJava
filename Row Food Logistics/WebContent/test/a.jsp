<%@page import="com.tt.model.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<head>
</head>
<body>
	<a href="b.jsp" >去b.jsp查找book表的所有数据，并且在b里面显示</a>
	<a href="b3.jsp" >去b3.jsp查找book表的所有数据，并且在a里面显示</a>
	<table>
	<%
		if(request.getAttribute("tt") != null){
			ArrayList abooks = (ArrayList)request.getAttribute("tt");
			for(int i=0;i<abooks.size();i++){
				Book b = (Book)abooks.get(i);
				%>
					<tr><td> <%=b.getId() %> </td> <td> <%=b.getTitle() %> </td></tr>
				<%
			}
		}
	%>
	</table>
	<!-- <form action="c.jsp" method="post">
		<input type="text" name="username">
		<input type="submit" value="ok">
	</form> -->
	
	<form action="/Row_Food_Logistics/firstServlet" method="post">
		<input type="text" name="username">
		<input type="submit" value="ok">
	</form>
</body>
</html>