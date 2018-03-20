<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="src.com.yxq.valuebean.Book"%>
<jsp:useBean id="myCar" class="src.com.yxq.toolbean.ShopCar"
	scope="session" />
<center>
	<body background="fruit.jpg">
		<table border="1" width="650" rules="none" cellspacing="0"
			cellpadding="0" style="background: #eeeeff">
			<tr height="50">
				<td colspan="5" align="center">购买的图书如下</td>
			</tr>
			<tr align="center" height="30" bgcolor="lightgrey">
				<td width="20%">书名</td>
				<td width="10%">作者</td>
				<td>价格(元)</td>
				<td>已购数量</td>
				<td>剩余数量</td>
				<td>总价(元)</td>
				<td>移除(-1/次)</td>
			</tr>
			<%
				String pageNo = request.getParameter("pageNo");
				//从session里面获得buylist
				ArrayList buylist = (ArrayList)session.getAttribute("buylist");
				double total = 0; 
				if (buylist == null || buylist.size() == 0) {
			%>
			<tr height="100">
				<td colspan="5" align="center">您的购物车为空！</td>
			</tr>
			<%
				} else {
					for (int i = 0; i < buylist.size(); i++) {
						Book single = (Book) buylist.get(i);
						double price = single.getPrice();
						int num = single.getTempno();
						int remain =single.getRemain();
						int num2 = remain - num;
						double money = price * num; //计算当前商品总价，并进行四舍五入
						total += money; //计算应付金额
			%>
			<tr align="center" height="50">
				<td><%=single.getTitle()%></td>
				<td><%=single.getAuthor()%></td>
				<td><%=price%></td>
				<td><%=num%></td>
				<td><%=num2%></td>
				<td><%=money%></td>
				<td><a href="<%=request.getContextPath()%>/cart?action=remove&id=<%=single.getId() %>&pageNo=<%=pageNo %>">移除</a></td>
			</tr>
			<%
				}
				}
			%>
			<tr height="50" align="center">
				<td colspan="5">应付金额：<%=total%></td>
			</tr>
			<tr height="60" align="center">
				<td colspan="2"><a href="page?jumpPage=<%=pageNo %>">继续购物</a></td>
				<td colspan="2"><a href="<%=request.getContextPath()%>/cart?action=clear&pageNo=<%=pageNo %>">清空购物车</a></td>
				<td colspan="3"><a href="<%=request.getContextPath()%>/cart?action=pay&pageNo=<%=pageNo %>">付款</a></td>
			</tr>
		</table>
	</body>
</center>