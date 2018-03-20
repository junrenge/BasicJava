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
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.7.min.js"></script>
<script type="text/javascript">
$("document").ready(function(){ 
	//对角线input为1，下三角readonly
	for (var i = 1; i <= 5; i++) {
	var mip = $("input[name$='"+i+i+"']");//jquery对象
	mip.each(function(){
		$(this)[0].readOnly=true;
		$(this).val(1);
		$(this).css('background-color','#BFEFFF');
	});
	/* mip[0].readOnly=true;
	mip.val(1); */
	}
	
	for (var i = 1; i <= 5; i++) {
		for (var j = 1; j <= 5; j++) {
			if(i>j){
				var mip = $("input[name$='"+i+j+"']");//jquery对象
				mip.each(function(){
					$(this)[0].readOnly=true;
					$(this).val(0);
					$(this).css('background-color','#BFEFFF');
				});	
			}
		}
	}
	
	//构造矩阵
	var obj = $('#data').val();
	var t0 = eval(obj)[3];
	var t1 = eval(obj)[0];
	var t2 = eval(obj)[1];
	var t3 = eval(obj)[2];
	
	//只要消失，则值设为0
	for (var i = 0; i < t1[1]; i++) {
		var notchoose = t1[i+2];
		$("input[name='1"+notchoose+notchoose+"']").val(0);
		 for (var j = 0; j <= t1[0]; j++) {
			var row = $("#1"+j+notchoose);//jquery对象
			row[0].style.display= "none"; 
			
			row = $("#1"+notchoose+j);//jquery对象
			row[0].style.display= "none"; 
		} 
	}
	
	for (var i = 0; i < t2[1]; i++) {
		var notchoose = t2[i+2];
		$("input[name='2"+notchoose+notchoose+"']").val(0);
		 for (var j = 0; j <= t2[0]; j++) {
			var row = $("#2"+j+notchoose);//jquery对象
			row[0].style.display= "none"; 
			
			row = $("#2"+notchoose+j);//jquery对象
			row[0].style.display= "none"; 
		} 
	}
	
	for (var i = 0; i < t3[1]; i++) {
		var notchoose = t3[i+2];
		$("input[name='3"+notchoose+notchoose+"']").val(0);
		 for (var j = 0; j <= t3[0]; j++) {
			var row = $("#3"+j+notchoose);//jquery对象
			row[0].style.display= "none"; 
			
			row = $("#3"+notchoose+j);//jquery对象
			row[0].style.display= "none"; 
		} 
	} 
	
	});
</script>
</head>
<body>
<input type="hidden" value="${sessionScope.message.data}" id="data" />
	<center>
	<br><br><br>
	<p>请对风险类型及其指标的重要关系进行赋值</p>
	<form action="eval1" method="post">
	<div>
		<div style="background:#ee1122; width:50%; align:center">
		<table class="table">
			<tr> 
				<th class="spec" id="000"></th> 
				<th id="001">内部风</th> 
				<th id="002">合作风</th> 
				<th id="003">外部风</th> 
			</tr> 
			<tr>
				<th class="spec" id="010">内部风险</th>
				<td id="011"><input type="text" name="011"/></td>
				<td id="012"><input type="text" name="012"/></td>
				<td id="013"><input type="text" name="013"/></td>
			</tr>
			<tr>
				<th class="spec" id="020">合作风险</th>
				<td id="021"><input type="text" name="021"/></td>
				<td id="022"><input type="text" name="022"/></td>
				<td id="023"><input type="text" name="023"/></td>
			</tr>
			<tr>
				<th class="spec" id="030">外部风险</th>
				<td id="031"><input type="text" name="031"/></td>
				<td id="032"><input type="text" name="032"/></td>
				<td id="033"><input type="text" name="033"/></td>
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
				<th class="spec" id="110">组织</th>
				<td id="111"><input type="text" name="111"/></td>
				<td id="112"><input type="text" name="112"/></td>
				<td id="113"><input type="text" name="113"/></td>
				<td id="114"><input type="text" name="114"/></td>
				<td id="115"><input type="text" name="115"/></td>
			</tr>
			<tr>
				<th class="spec" id="120">库存</th>
				<td id="121"><input type="text" name="121"/></td>
				<td id="122"><input type="text" name="122"/></td>
				<td id="123"><input type="text" name="123"/></td>
				<td id="124"><input type="text" name="124"/></td>
				<td id="125"><input type="text" name="125"/></td>
			</tr>
			<tr>
				<th class="spec" id="130">采购</th>
				<td id="131"><input type="text" name="131"/></td>
				<td id="132"><input type="text" name="132"/></td>
				<td id="133"><input type="text" name="133"/></td>
				<td id="134"><input type="text" name="134"/></td>
				<td id="135"><input type="text" name="135"/></td>
			</tr>
			<tr>
				<th class="spec" id="140">配送</th>
				<td id="141"><input type="text" name="141"/></td>
				<td id="142"><input type="text" name="142"/></td>
				<td id="143"><input type="text" name="143"/></td>
				<td id="144"><input type="text" name="144"/></td>
				<td id="145"><input type="text" name="145"/></td>
			</tr>
			<tr>
				<th class="spec" id="150">财务</th>
				<td id="151"><input type="text" name="151"/></td>
				<td id="152"><input type="text" name="152"/></td>
				<td id="153"><input type="text" name="153"/></td>
				<td id="154"><input type="text" name="154"/></td>
				<td id="155"><input type="text" name="155"/></td>
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
				<th class="spec" id="210">伙伴关系</th>
				<td id="211"><input type="text" name="211"/></td>
				<td id="212"><input type="text" name="212"/></td>
				<td id="213"><input type="text" name="213"/></td>
			</tr>
			<tr>
				<th class="spec"  id="220">信息传递</th>
				<td id="221"><input type="text" name="221"/></td>
				<td id="222"><input type="text" name="222"/></td>
				<td id="223"><input type="text" name="223"/></td>
			</tr>
			<tr>
				<th class="spec" id="230">合作范围</th>
				<td id="231"><input type="text" name="231"/></td>
				<td id="232"><input type="text" name="232"/></td>
				<td id="233"><input type="text" name="233"/></td>
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
				<th class="spec" id="310">政治环境</th>
				<td id="311"><input type="text" name="311"/></td>
				<td id="312"><input type="text" name="312"/></td>
				<td id="313"><input type="text" name="313"/></td>
			</tr>
			<tr>
				<th class="spec" id="320">自然灾害</th>
				<td id="321"><input type="text" name="321"/></td>
				<td id="322"><input type="text" name="322"/></td>
				<td id="323"><input type="text" name="323"/></td>
			</tr>
			<tr>
				<th class="spec" id="330">市场波动</th>
				<td id="331"><input type="text" name="331"/></td>
				<td id="332"><input type="text" name="332"/></td>
				<td id="333"><input type="text" name="333"/></td>
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