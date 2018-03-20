<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function(){
		
		document.getElementsByTagName("a")[0].onclick = function(){
			var request = new XMLHttpRequest();
			var url = this.href;
			var method = "GET";
			request.open(method,url);
			request.send(null);
			request.onreadystatechange = function(){
				if(request.readyState == 4){
					if(request.status == 200 || request.status == 304){
						//document.getElementById("d").innerHTML = request.responseText;
						/* var result = request.responseXML;
						var name = result.getElementsByTagName("name")[0].firstChild.nodeValue;
						var password = result.getElementsByTagName("password")[0].firstChild.nodeValue;*/
						var result = request.responseText;
						var jsonstr = eval("(" + result + ")");
						var name = jsonstr.name;
						alert(name);
						var password = jsonstr.password;
						var h2Node = document.createElement("h2");
						h2Node.appendChild(document.createTextNode(name));
						var h3Node = document.createElement("h3");
						h3Node.appendChild(document.createTextNode(password));
						
						document.getElementById("d").appendChild(h2Node).appendChild(h3Node);
					}
				}
			}
			
			return false;
		};
		
	}
</script>
</head>
<body>

	<a href="xu.js">click</a>
	<div id="d"></div>
</body>
</html>