<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>选择授课</title>
<style type="text/css">
table.imagetable {
	font-family: verdana, arial, sans-serif;
	font-size: 11px;
	color: #333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
	width: 60%;
	margin-top: 10px;
}

table.imagetable th {
	background: #b5cfd2 url('blue.jpg');
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
}

table.imagetable td {
	background: #dcddc0 url('grey.jpg');
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
}
</style>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.7.min.js"></script>
<script type="text/javascript">
$("document").ready(function(){ 

	var flag = 0;
	$("#scall").click(function(){ 
		if (flag == 0) { // 全选 
            $("input[name='aaa']").each(function () {
                $(this).attr("checked", true);
            });
			flag = 1;
        }
        else { // 取消全选 
            $("input[name='aaa']").each(function () {
                $(this).attr("checked", false);
            });
        	flag = 0;
        }
	}); 
	
	$("#writeall").click(function(){
		var sno=""; 
		var grade="";
		var cno="";
		var temp;
		$('input[name="aaa"]:checked').each(function(){ 
			sno += $(this).val()+","; 
			temp = $(this).val();
			grade += $("#grade_"+temp).val()+",";
		}); 
		if(sno == ""){
			alert("没有选择任何学生！");
			return false;
		}else{
			var url = "<%=request.getContextPath()%>/sc?method=writeall";
			var date = {
				"time" : new Date(),
				"grade" : grade,
				"cno" : $("#cno").val(),
				"sno" : sno,
			};
// 			alert(sno); 
// 			alert(grade); 
// 			alert($("#cno").val());
			$.post(url, date,null);
		}
	}); 
	});

	function writeonce(c,s) {
		var url = "<%=request.getContextPath()%>/sc?method=writeonce";
		var date = {
			"time" : new Date(),
			"grade" : $("#grade_"+s).val(),
			"cno" : c,
			"sno" : s,
		};
		alert("即将把"+s+"同学的"+c+"课程成绩改为"+$("#grade_"+s).val());
		$.post(url, date,null);
	}
</script>
</head>
<body marginwidth="100px">
 	<form action="" method="post">
		<table class="imagetable">
			<tr>
				<th><input type="button" value="全选" id="scall"></th>
				<th>课程号</th>
				<th>课程名</th>
				<th>学生号</th>
				<th>学生姓名</th>
				<th>成绩</th>
				<th>录入</th>
			</tr>
			<c:forEach var="l" items="${requestScope.lurus}">
				<tr>
					<td><input type="checkbox" name="aaa" value="${l.sno }"/></td>
					<td>${l.cno }</td>
					<input type="hidden" value="${l.cno }" id="cno">
					<td>${l.cname }</td>
					<td>${l.sno }</td>
					<td>${l.sname }</td>
					<td><input id="grade_${l.sno }" type="text"
						value="${l.grade }" name="${l.cno }" /></td>
					<td><input type="button" value="写"
						onclick="writeonce('${l.cno}',${l.sno })"></td>
				</tr>
			</c:forEach>
		</table>
		<br> <input type="submit" value="全写" id="writeall" onclick="writeall('${l.cno}')" />
	</form>

</body>
</html>