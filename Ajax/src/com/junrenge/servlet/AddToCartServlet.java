package com.junrenge.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.junrenge.beans.ShoppingCart;

public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookname = request.getParameter("bookname");
		double price = Double.parseDouble(request.getParameter("price"));
		ShoppingCart sc = (ShoppingCart) request.getSession().getAttribute("sc");
		if(sc == null){
			sc = new ShoppingCart();
			request.getSession().setAttribute("sc", sc);
		}
		sc.addToCart(bookname, price);
		/*StringBuilder sb = new StringBuilder();
		sb.append("{")
		  .append("\"bookname\" : \"" + bookname +"\"")
		  .append(",\"number\" : " + sc.getTotalNumber())
		  .append(",\"price\" : " + sc.getTotalPrice())
		  .append("}");*/
		ObjectMapper mapper = new ObjectMapper();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		response.getWriter().print(mapper.writeValueAsString(sc));
	}

}
