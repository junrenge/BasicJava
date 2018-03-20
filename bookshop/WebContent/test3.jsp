<%@page import="java.util.ArrayList"%>
<%@page import="src.com.yxq.valuebean.Book"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=gb2312" language="java"%>
<html>
<head>
<title>�ļ��ϴ�����ҳ��</title>
<style type="text/css">
.lay1 {
	font-size: 18px;
	font-family: ΢���ź�;
	width: 200px;
	height: 20px;
}

.lay2 {
	font-size: 14px;
	font-family: ΢���ź�;
	position: fixed;
	left: 35%;
	bottom: 45px;
	width: 400px;
}

.foot{
	font-size: 10px;
}

.title {
	color: #0000ff;
}

.author {
	font-size: 12px;
}

.price {
	color: #ff0000
}

.kind,.remain {
	font-size: 14px;
}

.head{
	font-size: 20px;
	font-family: ΢���ź�;
}

.button {
	min-height: 1.5em;
	display: inline-block;
	padding: 2px 3px;
	margin: 4px 5px 5px 0px;
	cursor: pointer;
	opacity: 0.9;
	color: #121212;
	font-size: 0.5em;
	letter-spacing: 1px;
	text-shadow: rgba(0, 0, 0, 0.9) 0px 1px 2px;
	/*��ť�ı���*/
	background: #bcbcbc;
	border: 1px solid #242424;
	border-radius: 4px;
	box-shadow: rgba(255, 255, 255, 0.25) 0px 1px 0px, inset
		rgba(255, 255, 255, 0.25) 0px 1px 0px, inset rgba(0, 0, 0, 0.25) 0px
		0px 0px, inset rgba(255, 255, 255, 0.03) 0px 20px 0px, inset
		rgba(0, 0, 0, 0.15) 0px -20px 20px, inset rgba(255, 255, 255, 0.05)
		0px 20px 20px;
	transition: all 0.1s linear;
}

.button:hover {
	box-shadow: rgba(0, 0, 0, 0.5) 0px 2px 5px, inset
		rgba(255, 255, 255, 0.25) 0px 1px 0px, inset rgba(0, 0, 0, 0.25) 0px
		0px 0px, inset rgba(255, 255, 255, 0.03) 0px 20px 0px, inset
		rgba(0, 0, 0, 0.15) 0px -20px 20px, inset rgba(255, 255, 255, 0.05)
		0px 20px 20px;
}

.shine {
	display: block;
	position: relative;
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00ffffff',
		endColorstr='#00ffffff', GradientType=1);
	background: linear-gradient(left, rgba(255, 255, 255, 0) 0%,
		rgba(255, 255, 255, 1) 50%, rgba(255, 255, 255, 0) 100%);
	padding: 0px 12px;
	top: -12px;
	left: -24px;
	height: 1px;
	box-shadow: rgba(255, 255, 255, 0.2) 0px 1px 5px;
	transition: all 0.3s ease-in-out;
}
</style>
<script type="text/javascript">
	document.getElementById("");
</script>
</head>
<jsp:useBean id="page2" class="src.com.yxq.toolbean.PageBean"
	scope="request" />
<body>
	<center>
		<script language="JavaScript" type="text/JavaScript">
			function Jumping() {
				document.PageForm.submit();
				return;
			}

			function gotoPage(pagenum) {
				document.PageForm.jumpPage.value = pagenum;
				document.PageForm.submit();
				return;
			}
		</script>
		<marquee scrollAmount="10" width="n" height="n" direction="type"
		scrollDelay="n" behavior="type" loop="n" onmouseover="this.stop()"
		onmouseout="this.start()">
		<a style="color: CC6600"><%=new Date() %>��ӭ��ӭ!��ӭ����!</a>
	</marquee>
	<span class="head">����ͼ��</span><a href="index.jsp" style="float: right;">��½</a>
	<%
		String s = String.valueOf(page2.getCurPage());
		try {
			ArrayList list = page2.getResult(s).goodslist;
// 			session.setAttribute("goodslist", list);
			for (int i = 0; i < list.size(); i++) {
				Book single = (Book) list.get(i);
	%>
<!-- 	��ʾÿһ���� -->
	<div class="lay1" style="width: 20%; padding: 10px">
		<div style="width: 60%; height: 150px; float: left">
			<img height="130" width="150" src="<%=request.getContextPath()%>/pic.jsp?picid=<%=single.getId() %>.jpg"><br>
			<span class="author">�ѳɽ�<%=single.getSales()%>��</span><br>
		</div>
		<div style="width: 40%; height: 100px; float: left">
			<span class="title"><%=single.getTitle()%></span><br> <span
				class="author"><%=single.getAuthor()%></span><br> <span
				class="price">��<%=single.getPrice()%></span><br> <span
				class="kind">����:<%=single.getKind()%></span><br> <span
				class="remain">���:<%=single.getRemain()%>��
		</span><br> <a class="button" href="<%=request.getContextPath()%>/cart?action=buy&id=<%=single.getId()%>&pageNo=<%=page2.getCurPage()%>" style="text-decoration: none">���빺�ﳵ</a><br>
		</div>
	</div>
	<%
		}
		} catch (Exception e) {
		}
	%>
	<a class="button" href="shopcar.jsp?pageNo=<%=page2.getCurPage()%>" style="text-decoration: none;">�鿴���ﳵ</a>
	<div class="lay2">
		<%
			if (page2.getMaxPage() != 1) {
		%>
		<form name="PageForm" action="<%=request.getContextPath()%>/page"
			method="get">
			<%
				if (page2.getCurPage() == 1) {
						out.print(" ��ҳ ��һҳ");
					} else {
			%>
			<a HREF="javascript:gotoPage(1)">��ҳ</A> <a
				HREF="javascript:gotoPage(<%=page2.getCurPage() - 1%>)">��һҳ</A>
			<%
				}
			%>
			<%
				if (page2.getCurPage() == page2.getMaxPage()) {
						out.print("��һҳ βҳ");
					} else {
			%>
			<a HREF="javascript:gotoPage(<%=page2.getCurPage() + 1%>)">��һҳ</A> <a
				HREF="javascript:gotoPage(<%=page2.getMaxPage()%>)">βҳ</A>
			<%
				}
			%>
			ת���� <SELECT name="jumpPage" onchange="Jumping()">
				<%
					for (int i = 1; i <= page2.getMaxPage(); i++) {
							if (i == page2.getCurPage()) {
				%>
				<OPTION selected value="<%=i%>"><%=i%>
				</OPTION>
				<%
					} else {
				%>
				<OPTION value="<%=i%>"><%=i%>
				</OPTION>
				<%
					}
						}
				%>
			</SELECT> ҳ<br> 
			<div class="foot">ÿҳ<%=page2.rowsPerPage%>�� ��<%=page2.getMaxRowCount()%>�� ��<%=page2.getCurPage()%>ҳ
			��<%=page2.getMaxPage()%>ҳ</div>
		</form>
		<%
			}
		%>
	</div>
	</center>
</body>
</html>
</html>

