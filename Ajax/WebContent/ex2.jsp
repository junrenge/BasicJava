<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.7.2.js" ></script>
<script type="text/javascript">
	$(function(){
		var flag = "${senssionScope.sc == null}";
		if(flag == "true"){
			$("#msg").hide();
		}else{
			$("#msg").show();
			$("#bookname").text("${senssionScope.sc.bookname}");
			$("#number").text("${senssionScope.sc.totalNumber}");
			$("#price").text("${senssionScope.sc.totalPrice}");
		}
		
		$("a").click(function(){
			var url = this.href;
			var args = {time : new Date()};
			$.getJSON(url,args,function(data){
				$("#bookname").text(data.bookname);
				$("#number").text(data.totalNumber);
				$("#price").text(data.totalPrice);
			});
			$("#msg").show();
			return false;
		});
	})
</script>
</head>
<body>

	<div id="msg">
		你选择了<span id="bookname"></span>,购物车共有<span id="number"></span>本书,一共<span id="price"></span>元。
	</div>
	<br><br>
	<a href="${pageContext.request.contextPath}/addToCartServlet?bookname=Java&price=100">Java</a><br>
	<a href="${pageContext.request.contextPath}/addToCartServlet?bookname=Oracle&price=200">Oracle</a><br>
	<a href="${pageContext.request.contextPath}/addToCartServlet?bookname=Spring&price=300">Spring</a><br>

</body>
</html>