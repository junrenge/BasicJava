<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
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
}
</style> 
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.7.min.js"></script>
<script type="text/javascript">
$("document").ready(function(){ 
	//构造矩阵
	var obj = $('#data').val();
	var obj2 = $('#data2').val();
	alert(1);
	alert(obj2);
	var obj3 = $('#data3').val();
	var obj4 = $('#data4').val();
	var i;
	//设置没选的指标
	var t1 = eval(obj)[0];
	var t2 = eval(obj)[1];
	var t3 = eval(obj)[2];
	for (i = 0; i < t1[1]; i++) {
		var notchoose = t1[i+2];
		$("#10"+notchoose)[0].style.display = "none";
	}
	for (i = 0; i < t2[1]; i++) {
		var notchoose = t2[i+2];
		$("#20"+notchoose)[0].style.display = "none";
	}
	for (i = 0; i < t3[1]; i++) {
		var notchoose = t3[i+2];
		$("#30"+notchoose)[0].style.display = "none";
	}
	
	//显示评价向量
	for (i = 0; i < obj3.length; i++) {
		$("input[name='"+i+"21']").val(eval(obj3)[i]); 
	}
	
	//显示得分
	for (i = 0; i < obj4.length; i++) {
		$("input[name='"+i+"31']").val(eval(obj4)[i]); 
	}
	
	//显示权向量
	for (i = 0; i < obj2.length; i++) {
		$("input[name='"+i+"11']").val(eval(obj2)[i]); 
	}
});
</script>
</head>
<body>
<input type="hidden" value="${sessionScope.message.data}" id="data" />
<input type="hidden" value="${sessionScope.weight.data}" id="data2" />
<input type="hidden" value="${sessionScope.rsv.data}" id="data3" />
<input type="hidden" value="${sessionScope.result.data}" id="data4" />
	<center>
	<br><br>
	<p>计算结果</p>
	<div>
		<div style="background:#ee1122; width:50%; align:center">
		<table class="table">
			<tr> 
				<th class="spec" id="000"></th> 
				<th id="001">内部风险</th> 
				<th id="002">合作风险</th> 
				<th id="003">外部风险</th> 
			</tr> 
			<tr>
				<th class="spec" id="010">权向量</th>
				<td id="011" colspan="3"><input type="text" name="011"/></td>
			</tr>
			<tr>
				<th class="spec" id="020">评价向量</th>
				<td id="021" colspan="3"><input type="text" name="021"/></td>
			</tr>
			<tr>
				<th class="spec" id="030">得分</th>
				<td id="031" colspan="3"><input type="text" name="031"/></td>
			</tr>
		</table>
		</div>
	</div>
	<br><br>
	<div>
		<div style="background:#ee1122; float:left; width:30%; margin-left:3%">
			<table class="table">
			<tr> 
				<th class="spec" id="100"></th> 
				<th id="101">组织</th> 
				<th id="102">库存</th> 
				<th id="103">采购</th> 
				<th id="104">配送</th> 
				<th id="105">财务</th> 
			</tr> 
			<tr>
				<th class="spec" id="110">权向量</th>
				<td id="111" colspan="5"><input type="text" name="111"/></td>
			</tr>
			<tr>
				<th class="spec" id="120">评价向量</th>
				<td id="121" colspan="5"><input type="text" name="121"/></td>
			</tr>
			<tr>
				<th class="spec" id="130">得分</th>
				<td id="131" colspan="5"><input type="text" name="131"/></td>
			</tr>
		</table>
		</div>
		
		<div style="background:#ee3355; float:left; width:30%; margin-left:3%">
			<table class="table">
			<tr> 
				<th class="spec" id="200"></th> 
				<th id="201">伙伴关系</th> 
				<th id="202">信息传递</th> 
				<th id="203">合作范围</th> 
			</tr> 
			<tr>
				<th class="spec" id="210">权向量</th>
				<td id="211" colspan="3"><input type="text" name="211"/></td>
			</tr>
			<tr>
				<th class="spec"  id="220">评价向量</th>
				<td id="221" colspan="3"><input type="text" name="221"/></td>
			</tr>
			<tr>
				<th class="spec" id="230">得分</th>
				<td id="231" colspan="3"><input type="text" name="231"/></td>
			</tr>
		</table>
		</div>
		
		<div style="background:#dd5566; float:left; width:30%; margin-left:3%">
			<table class="table">
			<tr> 
				<th class="spec" id="300"></th> 
				<th id="301">政治环境</th> 
				<th id="302">自然灾害</th> 
				<th id="303">市场波动</th> 
			</tr> 
			<tr>
				<th class="spec" id="310">权向量</th>
				<td id="311" colspan="3"><input type="text" name="311"/></td>
			</tr>
			<tr>
				<th class="spec" id="320">评价向量</th>
				<td id="321" colspan="3"><input type="text" name="321"/></td>
			</tr>
			<tr>
				<th class="spec" id="330">得分</th>
				<td id="331" colspan="3"><input type="text" name="331"/></td>
			</tr>
		</table>
		</div>
		<div style="clear:both"></div>  
	</div>
	<br><br>
	
	<table class="table"  style="width:50%; text-align:center">
		<tr>
			<th>评价值</th>
			<th>等级</th>
		</tr>
		<tr>
			<td>X≥3.5</td>
			<td>低</td>
		</tr>
		<tr>
			<td>2.5＜X≤3.5</td>
			<td>中</td>
		</tr>
		<tr>
			<td>1.5＜X≤2.5</td>
			<td>高</td>
		</tr>
		<tr>
			<td>X≤1.5</td>
			<td>很高</td>
		</tr>
	</table>
	<a href="index.jsp">返回首页</a>
	</center>
</body>
</html>