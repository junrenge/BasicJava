<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>ѡ���ڿ�</title>
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
		if (flag == 0) { // ȫѡ 
            $("input[name='aaa']").each(function () {
                $(this).attr("checked", true);
            });
			flag = 1;
        }
        else { // ȡ��ȫѡ 
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
			alert("û��ѡ���κ�ѧ����");
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
		alert("������"+s+"ͬѧ��"+c+"�γ̳ɼ���Ϊ"+$("#grade_"+s).val());
		$.post(url, date,null);
	}
</script>
</head>
<body marginwidth="100px">
 	<form action="" method="post">
		<table class="imagetable">
			<tr>
				<th><input type="button" value="ȫѡ" id="scall"></th>
				<th>�γ̺�</th>
				<th>�γ���</th>
				<th>ѧ����</th>
				<th>ѧ������</th>
				<th>�ɼ�</th>
				<th>¼��</th>
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
					<td><input type="button" value="д"
						onclick="writeonce('${l.cno}',${l.sno })"></td>
				</tr>
			</c:forEach>
		</table>
		<br> <input type="submit" value="ȫд" id="writeall" onclick="writeall('${l.cno}')" />
	</form>

</body>
</html>