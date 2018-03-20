<%@ page contentType="text/html;charset=utf-8"%>
<%@page import="java.sql.*"%>
<%@ page import="src.com.yxq.valuebean.Book"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.min.js"></script>
<html>
<head>
<title>修改页面</title>
</head>
<body>
	<center>
		<c:set var="s" value="${book }"></c:set>
		<h2>编辑图书</h2>
		<table>
			<form action="admindo.jsp?action=save" method="post" border="1">
				<input type="hidden" name="id" value="${s.id }" />
				<tr>
					<td colspan="2" align="center"><img src="<%=request.getContextPath()%>/pic.jsp?picid=${s.id }.jpg" width="100" height="150"></td>
				</tr>
				<tr>
					<td>书名</td>
					<td><input type="text" id="title" name="title" value="${s.title }" /></td>
				</tr>
				<tr>
					<td>作者</td>
					<td><input type="text" id="author" name="author" value="${s.author }" /></td>
				</tr>
				<tr>
<!-- 					下拉框 -->
					<td>种类</td>
					<td>
						<select name="kind" style="width:80px;">
                  			 <option selected value="文学">文学</option>
                			 <option value="历史">历史</option>
                 			 <option value="科技">科技</option>
                 			 <option value="戏曲">戏曲</option>
                 			 <option value="娱乐">娱乐</option>
                  </select>
					</td>
				</tr>
				<tr>
					<td>价格</td>
					<td><input type="text" id="price" name="price" value="${s.price }" /></td>
				</tr>
				<tr>
					<td>剩余数量</td>
					<td><input type="text" id="remain" name="remain" value="${s.remain }" /></td>
				</tr>
				<tr>
					<td colspan="1" align="center"><input type="submit" style="display: none;" id="form1submit" /><input type="button" onclick="checkSubmit()" value="确定"  /></td>
				</tr>
			</form>

			<FORM METHOD="POST" ACTION="upload.jsp?picid=${s.id }.jpg" ENCTYPE="multipart/form-data" >
				<tr>
					<td>上传封面</td>
					<td><input type="file" name="pic" size="50" /></td>
				</tr>
				<tr>
					<td colspan="1" align="center"><input type="submit" value="上传" id="form2submit" /></td>
				</tr>
			</FORM>
		</table>
	</center>
</body>
<script type="text/javascript">

String.prototype.trim=function() {

    return this.replace(/(^\s*)|(\s*$)/g,'');
}

function checkSubmit(){
	var v1 = $("#title").val();
	var v2 = $("#author").val();
	var v3 = $("#price").val();
	var v4 = $("#remain").val();
	v4 = v4.trim();
	if(v1==""||v2==""||v3==""||v4==""){
		alert("编辑有误，不能为空");
	}else{
		$("#form1submit").click();
	}
}
	function submitAll(){
		$("#form2submit").click();
		$("#form1submit").click();
	}
</script>
</html>