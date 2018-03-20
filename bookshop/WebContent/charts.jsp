<%@ page language="java" import="java.util.*"
	contentType="text/html;
	charset=utf-8"%>
<html>
<head>
<script src="<%=request.getContextPath()%>/js/echarts.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.7.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<center>
	<div style="padding-top:10px; color: #232323; height: 20%">
	<form action="" method="post">
		书名&nbsp;&nbsp;:<input id="bookname" type="text" name="bookname" style="font-size: 16px " />
		&nbsp;&nbsp;&nbsp;&nbsp;
		类别&nbsp;&nbsp;:<select id="kind" name="kind" style="font-size: 16px">
                  			 <option selected value="文学">文学</option>
                			 <option value="历史">历史</option>
                 			 <option value="科技">科技</option>
                 			 <option value="戏曲">戏曲</option>
                 			 <option value="娱乐">娱乐</option>
        </select>
        &nbsp;&nbsp;&nbsp;&nbsp;
		时间选择:<input id="from" name ="from" type="text" placeholder="from" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
			  <input id="to" name ="to" type="text" placeholder="to" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" onclick="drawpic()" value="搜索" />
	</form>	
	</div>
<!-- 	单本书的柱形图，	单个类别的柱形图 -->
	<div id="single" style="width: 33%; height: 50%; float: left">的所得税</div>
<!-- 	总体的柱形图 -->
	<div id="cylindar" style="width: 33%; height: 50%; float: left"></div>
<!-- 	总体的饼形图 -->
	<div id="pie" style="width: 33%; height: 50%; float: left"></div>
	
	<div style="height: 10%;">
			<a href="admin.jsp">返回管理页面</a>
	</div>
</center>
</body>
</html>
<script type="text/javascript">
// 第一次进入
$(document).ready(
		function () {
			drawpic();
})
// 绘制图形
	function drawpic(){
	var myChart1 = echarts.init(document.getElementById('cylindar'));
	var myChart2 = echarts.init(document.getElementById('pie'));
	var myChart3 = echarts.init(document.getElementById('single'));
	var kind;
	var value;
	var bn;
	var bnv;
	var url = "<%=request.getContextPath()%>/data?method=myData";
	var date = {
		"time" : new Date(),
		"bookname" : $("#bookname").val(),
		"kind" : $("#kind").val(),
		"from" : $("#from").val(),
		"to" : $("#to").val(),
	};
	$.getJSON(url, date,
			function(data) {
				kind = data.n;
				value = data.v;
				bn = data.bn;
				bnv = data.bnv;
				var option1 = {
					title : {
						text : '各种类别图书销售量柱形图',
					},
					tooltip : {
						trigger : 'axis',
						axisPointer : {
							type : 'shadow'
						}
					},
					grid : {
						left : '5%',
						right : '1%',
						bottom : '20%',
					},
					xAxis : [ {
						type : 'category',
						axisLabel : {
							interval : 0,
							rotate : 45,
							margin : 5,
							textStyle : {
								color : "#222"
							}
						},
						data : function() {
							var da = [];
							for (var i = 0; i < kind.length; i++) {
								da.push(kind[i]);
							}
							;
							return da;
						}(),
					} ],
					yAxis : [ {
						type : 'value'
					} ],
					series : [ {
						name : '',
						type : 'bar',
						data : function() {
							var da = [];
							for (var i = 0; i < value.length; i++) {
								da.push(value[i]);
							}
							;
							return da;
						}(),
						itemStyle : {
							normal : {
								color : function(params) {
									var colorList = [ '#C1232B', '#B5C334',
											'#FCCE10', '#E87C25', '#27727B',
											'#FE8463', '#9BCA63', '#FAD860',
											'#F3A43B', '#60C0DD', '#D7504B',
											'#C6E579', '#F4E001', '#F0805A',
											'#26C0C0' ];
									return colorList[params.dataIndex];
								},
							}
						}
					} ]
				};
				myChart1.setOption(option1);

				var option2 = {
					title : {
						text : '各种类别图书销售量饼图',
					},
					tooltip : {
						trigger : 'item',
						formatter : "{a} <br/>{b} : {c} ({d}%)"
					},
					series : [ {
						name : 'pie',
						type : 'pie',
						radius : '55%',
						data : function() {
							var da = [];
							for (var i = 0; i < kind.length; i++) {
								var item = {
									name : kind[i],
									value : value[i],
								}
								da.push(item);
							}
							;
							return da;
						}(),
						itemStyle : {
							emphasis : {
								shadowBlur : 10,
								shadowOffsetX : 0,
								shadowColor : 'rgba(0, 0, 0, 0.5)'
							}
						}
					} ]
				};
				myChart2.setOption(option2);
				
				var option3 = {
						title : {
							text : '单本图书单个类别销量柱形图',
						},
						tooltip : {
							trigger : 'axis',
							axisPointer : {
								type : 'shadow'
							}
						},
						grid : {
							left : '5%',
							right : '1%',
							bottom : '20%',
						},
						xAxis : [ {
							type : 'category',
							axisLabel : {
								interval : 0,
								rotate : 45,
								margin : 5,
								textStyle : {
									color : "#222"
								}
							},
							data : function() {
								var da = [];
								for (var i = 0; i < bn.length; i++) {
									da.push(bn[i]);
								}
								;
								return da;
							}(),
						} ],
						yAxis : [ {
							type : 'value'
						} ],
						series : [ {
							name : '',
							type : 'bar',
							data : function() {
								var da = [];
								for (var i = 0; i < bnv.length; i++) {
									da.push(bnv[i]);
								}
								;
								return da;
							}(),
							itemStyle : {
								normal : {
									color : function(params) {
										var colorList = [ '#C1232B', '#B5C334',
												'#FCCE10', '#E87C25', '#27727B',
												'#FE8463', '#9BCA63', '#FAD860',
												'#F3A43B', '#60C0DD', '#D7504B',
												'#C6E579', '#F4E001', '#F0805A',
												'#26C0C0' ];
										return colorList[params.dataIndex];
									},
								}
							}
						} ]
					};
					myChart3.setOption(option3);
			});
	}
</script>