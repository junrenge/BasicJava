<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript" src = "${pageContext.request.contextPath }/scripts/jquery-1.7.2.js" ></script>
<script type="text/javascript">
$(function(){
	$(":input[name='username']").change(function(){
		var username = $(this).val();
		username = $.trim(username);
		if(username != ""){
			var url = "${pageContext.request.contextPath }/validateServlet";
			var args = {"username":username,"time":new Date()};
			$.post(url,args,function(data){
				$("#message").html(data);
			})
		}
	});
	
})
</script>
</head>
<body>

	<form action="" method="post">
		<input type="text" name="username" />
		<br>
		<div id="message"></div>
		<br>
		<input type="submit" value="submit" />
	</form>

</body>
</html>