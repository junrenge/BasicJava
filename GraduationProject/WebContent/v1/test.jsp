<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
<script type="text/javascript">
	function show(){
		var text = document.getElementById("mip");
		alert(text.value);
	}
</script>
</head>
<body>
<input type="text" id="mip" />
<input type="button" value="确定" onclick="show()" />
</body>
</html>