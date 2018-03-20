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
	text-align:center;
	color: #4f6b72; 
	//background: #CAE8EA no-repeat; 
}

</style>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.7.min.js"></script>
<script type="text/javascript">
$("document").ready(function(){ 
	//构造矩阵
	var obj = $('#data').val();
	var t0 = eval(obj)[3];
	var t1 = eval(obj)[0];
	var t2 = eval(obj)[1];
	var t3 = eval(obj)[2];
	
	//只要消失，则值设为1
	for (var i = 0; i < t1[1]; i++) {
		var notchoose = t1[i+2];
		$("#1"+notchoose)[0].style.display = "none";
		$("input[name='1"+notchoose+"']").val(1); 
		/* for (var j = 1; j <= 4; j++) {
			$("input[name='1"+notchoose+j+"']").val(1);
		} */
	}
	
	for (var i = 0; i < t2[1]; i++) {
		var notchoose = t2[i+2];
		$("#2"+notchoose)[0].style.display = "none";
		$("input[name='2"+notchoose+"']").val(1); 
		/* for (var j = 1; j <= 4; j++) {
			$("input[name='2"+notchoose+j+"']").val(1);
		} */
	}
	
	for (var i = 0; i < t3[1]; i++) {
		var notchoose = t3[i+2];
		$("#3"+notchoose)[0].style.display = "none";
		$("input[name='3"+notchoose+"']").val(1); 
		/* for (var j = 1; j <= 4; j++) {
			$("input[name='3"+notchoose+j+"']").val(1);
		} */
	} 
	
	//获得权重
	var obj2 = $('#data2').val();
	var ta = eval(obj2)[0];
	var tb = eval(obj2)[1];
	var tc = eval(obj2)[2];
	var td = eval(obj2)[3];
	
	for (var i = 1; i <= t0[0]; i++) {
		$("input[name='0"+i+"']").val(ta[i-1].toString().substring(0,5)); 
	}
	var index = 0;
	for (var i = 1; i <= t1[0]; i++) {
		if($("input[name='1"+i+"']").val() != 1)
			$("input[name='1"+i+"']").val(tb[index++].toString().substring(0,5)); 
	}
	
	index = 0;
	for (var i = 1; i <= t2[0]; i++) {
		if($("input[name='2"+i+"']").val() != 1)
			$("input[name='2"+i+"']").val(tc[index++].toString().substring(0,5)); 
	}
	
	index = 0;
	for (var i = 1; i <= t3[0]; i++) {
		if($("input[name='3"+i+"']").val() != 1)
			$("input[name='3"+i+"']").val(td[index++].toString().substring(0,5)); 
	}
});
</script>
</head>

<body>
<input type="hidden" value="${sessionScope.message.data}" id="data" />
<input type="hidden" value="${sessionScope.weight.data}" id="data2" />
	<center>
	<br><br><br>
	<p>经过层级分析法得到各风险因素的权重，接下来请输入评价矩阵</p>
	<p>评价集V={v1,v2,v3,v4}对应着风险安全度{优秀，良好，一般，差}对应着分数{4,3,2,1}</p>
	<form action="eval2" method="post">
	<div>
		<div style="background:#ee1122; width:50%; align:center">
		<table class="table">
			<tr> 
				<th class="spec"></th> 
				<th>v1</th> 
				<th>v2</th> 
				<th>v3</th> 
				<th>v4</th> 
			</tr> 
			<tr id="01">
				<th class="spec">内部风险<input type="text" name="01"/></th>
				<td><input type="text" name="011"/></td>
				<td><input type="text" name="012"/></td>
				<td><input type="text" name="013"/></td>
				<td><input type="text" name="014"/></td>
			</tr>
			<tr id="02">
				<th class="spec">合作风险<input type="text" name="02"/></th>
				<td><input type="text" name="021"/></td>
				<td><input type="text" name="022"/></td>
				<td><input type="text" name="023"/></td>
				<td><input type="text" name="024"/></td>
			</tr>
			<tr id="03">
				<th class="spec">外部风险<input type="text" name="03"/></th>
				<td><input type="text" name="031"/></td>
				<td><input type="text" name="032"/></td>
				<td><input type="text" name="033"/></td>
				<td><input type="text" name="034"/></td>
			</tr>
		</table>
		</div>
	</div>
	<br><br>
	<div>
		<div style="background:#ee1122; float:left; width:30%; margin-left:3%">
			<table class="table">
			<tr> 
				<th class="spec"></th> 
				<th>v1</th> 
				<th>v2</th> 
				<th>v3</th> 
				<th>v4</th> 
			</tr> 
			<tr id="11">
				<th class="spec">组织风险<input type="text" name="11"/></th>
				<td><input type="text" name="111"/></td>
				<td><input type="text" name="112"/></td>
				<td><input type="text" name="113"/></td>
				<td><input type="text" name="114"/></td>
			</tr>
			<tr id="12">
				<th class="spec">库存风险<input type="text" name="12"/></th>
				<td><input type="text" name="121"/></td>
				<td><input type="text" name="122"/></td>
				<td><input type="text" name="123"/></td>
				<td><input type="text" name="124"/></td>
			</tr>
			<tr id="13">
				<th class="spec">采购风险<input type="text" name="13"/></th>
				<td><input type="text" name="131"/></td>
				<td><input type="text" name="132"/></td>
				<td><input type="text" name="133"/></td>
				<td><input type="text" name="134"/></td>
			</tr>
			<tr id="14">
				<th class="spec">配送风险<input type="text" name="14"/></th>
				<td><input type="text" name="141"/></td>
				<td><input type="text" name="142"/></td>
				<td><input type="text" name="143"/></td>
				<td><input type="text" name="144"/></td>
			</tr>
			<tr id="15">
				<th class="spec">财务风险<input type="text" name="15"/></th>
				<td><input type="text" name="151"/></td>
				<td><input type="text" name="152"/></td>
				<td><input type="text" name="153"/></td>
				<td><input type="text" name="154"/></td>
			</tr>
		</table>
		</div>
		<div style="background:#ee3355; float:left; width:30%; margin-left:3%">
			<table class="table">
			<tr> 
				<th class="spec"></th> 
				<th>v1</th> 
				<th>v2</th> 
				<th>v3</th> 
				<th>v4</th> 
			</tr> 
			<tr id="21">
				<th class="spec">伙伴关系<input type="text" name="21"/></th>
				<td><input type="text" name="211"/></td>
				<td><input type="text" name="212"/></td>
				<td><input type="text" name="213"/></td>
				<td><input type="text" name="214"/></td>
			</tr>
			<tr id="22">
				<th class="spec">信息传递<input type="text" name="22"/></th>
				<td><input type="text" name="221"/></td>
				<td><input type="text" name="222"/></td>
				<td><input type="text" name="223"/></td>
				<td><input type="text" name="224"/></td>
			</tr>
			<tr id="23">
				<th class="spec">合作范围<input type="text" name="23"/></th>
				<td><input type="text" name="231"/></td>
				<td><input type="text" name="232"/></td>
				<td><input type="text" name="233"/></td>
				<td><input type="text" name="234"/></td>
			</tr>
		</table>
		</div>
		<div style="background:#dd5566; float:left; width:30%; margin-left:3%">
			<table class="table">
			<tr> 
				<th class="spec"></th> 
				<th>v1</th> 
				<th>v2</th> 
				<th>v3</th> 
				<th>v4</th> 
			</tr> 
			<tr id="31">
				<th class="spec">政治环境<input type="text" name="31"/></th>
				<td><input type="text" name="311"/></td>
				<td><input type="text" name="312"/></td>
				<td><input type="text" name="313"/></td>
				<td><input type="text" name="314"/></td>
			</tr>
			<tr id="32">
				<th class="spec">自然灾害<input type="text" name="32"/></th>
				<td><input type="text" name="321"/></td>
				<td><input type="text" name="322"/></td>
				<td><input type="text" name="323"/></td>
				<td><input type="text" name="324"/></td>
			</tr>
			<tr id="33">
				<th class="spec">市场波动<input type="text" name="33"/></th>
				<td><input type="text" name="331"/></td>
				<td><input type="text" name="332"/></td>
				<td><input type="text" name="333"/></td>
				<td><input type="text" name="334"/></td>
			</tr>
		</table>
		</div>
		<div style="clear:both"></div>  
	</div>
	<div style="width:5%;height:30px">
		<input type="submit" value="确定" style="color:#aa2233"/>
	</div>
	</form>
	</center>
</body>
</html>