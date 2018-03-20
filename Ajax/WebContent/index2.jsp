<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="scripts/jquery-1.7.2.js"></script>
<script type="text/javascript">
	
	$(function(){
		$("a").click(function(){
			var url = this.href;
			var date = {"time" : new Date()};
			//jQuery包装的load()方法，用于html处理
			//$("#content").load(url,date);
			
			//jQuery包装的$get()方法，用于xml处理
			/* $.get(url, date, function(data){
				alert(data);
				var name = $(data).find("name").text();
				var password = $(data).find("password").text();
				$("#content").empty()
							 .append("<h2>"+ name +"</h2>")
							 .append("<h3>"+ password +"</h3>");
			}); */
			//JSON处理,或者在get()的type参数指定为json
			$.getJSON(url, date, function(data){
				alert(data);
				var name = data.name;
				var password = data.password;
				$("#content").empty()
							 .append("<h2>"+ name +"</h2>")
							 .append("<h3>"+ password +"</h3>");
			});
			return false;
		}); 
	});
	
</script>
</head>
<body>

	<a href="xu.js">click</a>
	<div id="content"></div>

</body>
</html>