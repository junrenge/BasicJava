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
				<td colspan="5" align="center">�����ͼ������</td>
			</tr>
			<tr align="center" height="30" bgcolor="lightgrey">
				<td width="20%">����</td>
				<td width="10%">����</td>
				<td>�۸�(Ԫ)</td>
				<td>�ѹ�����</td>
				<td>ʣ������</td>
				<td>�ܼ�(Ԫ)</td>
				<td>�Ƴ�(-1/��)</td>
			</tr>
			<%
				String pageNo = request.getParameter("pageNo");
				//��session������buylist
				ArrayList buylist = (ArrayList)session.getAttribute("buylist");
				double total = 0; 
				if (buylist == null || buylist.size() == 0) {
			%>
			<tr height="100">
				<td colspan="5" align="center">���Ĺ��ﳵΪ�գ�</td>
			</tr>
			<%
				} else {
					for (int i = 0; i < buylist.size(); i++) {
						Book single = (Book) buylist.get(i);
						double price = single.getPrice();
						int num = single.getTempno();
						int remain =single.getRemain();
						int num2 = remain - num;
						double money = price * num; //���㵱ǰ��Ʒ�ܼۣ���������������
						total += money; //����Ӧ�����
			%>
			<tr align="center" height="50">
				<td><%=single.getTitle()%></td>
				<td><%=single.getAuthor()%></td>
				<td><%=price%></td>
				<td><%=num%></td>
				<td><%=num2%></td>
				<td><%=money%></td>
				<td><a href="<%=request.getContextPath()%>/cart?action=remove&id=<%=single.getId() %>&pageNo=<%=pageNo %>">�Ƴ�</a></td>
			</tr>
			<%
				}
				}
			%>
			<tr height="50" align="center">
				<td colspan="5">Ӧ����<%=total%></td>
			</tr>
			<tr height="60" align="center">
				<td colspan="2"><a href="page?jumpPage=<%=pageNo %>">��������</a></td>
				<td colspan="2"><a href="<%=request.getContextPath()%>/cart?action=clear&pageNo=<%=pageNo %>">��չ��ﳵ</a></td>
				<td colspan="3"><a href="<%=request.getContextPath()%>/cart?action=pay&pageNo=<%=pageNo %>">����</a></td>
			</tr>
		</table>
	</body>
</center>