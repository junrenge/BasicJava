<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<head>
<title>ѧ������</title>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	text-align: center;
	margin: 5px
}

#wrapper {
	width: 90%;
	margin: auto;
	overflow: auto;
	height: 600px;
	border: 1px solid black;
}

#header {
	border: 1px solid black;
	height: 100px;
	background-size:100% 100%;
	background-image: url('head.png')
}

#left {
	float: left;
	width: 20%;
	border: 1px solid black;
	height: 496px;
}

#right {
	float: right;
	width: 80%;
	border: 1px solid black;
	height: 496px;
}
</style>
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<span style="margin-left:90%">����Σ�ͬѧ</span>
		</div>
		<div id="left">
			<ul>
				<li>�鿴ѧ��</li>
				<li>��������</li>
				<li>����ѡ��</li>
				<li>ѧҵ�ɼ�</li>
				<li>�ϴ�����</li>
			</ul>
		</div>
		<div id="right">
			<iframe>
				������
			</iframe>
		</div>
	</div>
</body>
</html>