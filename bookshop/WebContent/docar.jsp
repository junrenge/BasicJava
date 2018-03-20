<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="src.com.yxq.valuebean.Book"%>
<%@ page import="src.com.yxq.toolbean.MyTools"%>
<jsp:useBean id="myCar" class="src.com.yxq.toolbean.ShopCar"
	scope="session" />
<%
	String action = request.getParameter("action");
	String pageNo = request.getParameter("pageNo");
	if (action == null)
		action = "";
	if (action.equals("buy")){ //购买商品
		ArrayList goodslist = (ArrayList) session
				.getAttribute("goodslist");
		ArrayList buylist = myCar.getBuylist();
		System.out.println("购物车的大小为："+buylist.size());
		int id = MyTools.strToint(request.getParameter("id"));
		Book single = null;
		for (int i = 0; i < goodslist.size(); i++) { 
			Book temp = (Book) goodslist.get(i); 
			if (temp.getId() == id) {
				single = temp;
			}
		}
		if (single.getRemain() == 0) {
			response.sendRedirect("error.jsp");
		} else {
			myCar.addItem(single);
			response.sendRedirect("page?jumpPage="+pageNo);//回显第几页
		}
	}else if(action.equals("remove")) {
		int id = MyTools.strToint(request.getParameter("id"));
		myCar.removeItem(id);
		response.sendRedirect("shopcar.jsp");
	} else if (action.equals("clear")) {
		myCar.clearCar();
		response.sendRedirect("page?jumpPage="+pageNo);
	} else if (action.equals("pay")) {
		myCar.payCar();
		response.sendRedirect("page?jumpPage="+pageNo);
	}else {
		response.sendRedirect("page?jumpPage="+pageNo);
	}
%>