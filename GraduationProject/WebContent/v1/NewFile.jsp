<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>风险评估</title>
<style type="text/css"> 
.table 
{ 
align:center;
width: 100%; 
padding: 0; 
margin: 0; 
} 
th { 
font: bold 12px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif; 
color: #4f6b72; 
border: 1px solid #C1DAD7; 
letter-spacing: 2px; 
text-transform: uppercase; 
text-align: center; 
background: #CAE8EA no-repeat; 
padding: 6px 6px 6px 12px; 
width:60px;
height:30px;
} 
td { 
border: 1px solid #C1DAD7; 
background: #fff; 
font-size:14px; 
color: #4f6b72; 
width:60px;
height:30px;
} 

input{
	border:0;
	align:center;
	width:100%;
	height:100%;
}
</style>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.7.min.js"></script>
<script type="text/javascript">
$("document").ready(function(){ 
	//通过js改变table的tr th td的显示与隐藏
	/* var row = $("#01");//jquery对象
	row[0].style.display= "none"; 
	
	var row = $("#11");//jquery对象
	row[0].style.display= "none"; 
	
	var row = $("#02");//jquery对象
	row[0].style.display= "none"; 
	
	var row = $("#ab");//jquery对象 */
	//row[0].style.display= "none";
	var ones = $("#111");
	alert(ones.val());
	
	});
	
	function check(){
		var date = $("#date");
		alert(date.val());
	}
</script>
</head>
<body>
<input type="hidden" value="${sessionScope.message.data}" id="data" />
	<center>
	<br><br><br>
	<p>请对风险类型及其指标的重要关系进行赋值</p>
	<form action="">
	<div>
		<div style="background:#ee1122; width:50%; align:center">
		<table class="table">
			<tr id="ab"> 
				<th class="spec"></th> 
				<th id="01">内部风险</th> 
				<th id="02">合作风险</th> 
				<th id="03">外部风险</th> 
			</tr> 
			<tr id="cd"> 
				<th class="spec"></th> 
				<th id="111">内部风</th> 
				<th id="111">合作风</th> 
				<th id="13">外部风</th> 
			</tr>
			<tr>
				<th><input type="text" id="date" onclick="WdatePicker()"/></th>
			</tr>
			<tr>
				<td><input type="submit" name="submit" onclick="check()"/></td>
			</tr>
		</table>
		</div>
	</div>
</body>
</html>