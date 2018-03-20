<%@page import="java.io.*"%>
<html>
<head>
<title>文件上传处理页面</title>
</head>
<body>
	<%
		System.out.print(request.getServletPath()+"sss"+request.getRealPath());
		String picid = request.getParameter("picid");
		if(picid == null || "".equals(picid)){
			picid = "default.jpg";
		}
		String filename = "D:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\shop\\pic\\"+picid ;
		System.out.print(filename);
		File file = new File(filename);
		if(!file.exists()){
			file = new File("D:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\shop\\pic\\default.jpg");
		}
		FileInputStream in = new FileInputStream(file);
		response.setContentType("image/jpeg");
		OutputStream o = response.getOutputStream();
		int l = 0;
		byte[] buffer = new byte[1024];
		while ((l = in.read(buffer)) != -1) {
			o.write(buffer, 0, l);
		}
		o.flush();
		in.close();
		o.close();
		out.clear();  
		out = pageContext.pushBody();
	%>
</body>
</html>
