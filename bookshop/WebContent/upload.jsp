<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.util.*,com.jspsmart.upload.*" errorPage="" %>
<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload" />
<html>
<head>
	<title>�ļ��ϴ�����ҳ��</title>
</head>
<body>
	<%
	String picid = request.getParameter("picid");
	if(picid != null){
		mySmartUpload.initialize(pageContext);
		mySmartUpload.setTotalMaxFileSize(10000000);
		mySmartUpload.upload();
		try {
			String path = request.getRealPath("/")+"\\pic\\"+picid;
			System.out.println("path:"+path);
			if(!mySmartUpload.getFiles().getFile(0).isMissing()){
				mySmartUpload.getFiles().getFile(0).saveAs(path);
				System.out.println(path);
			}
				response.sendRedirect("admin.jsp");
		} catch (Exception e) { 
			out.println(e.toString());
		}
	}else{
		response.sendRedirect("admin.jsp");
	}
	%>
</body>
</html>
