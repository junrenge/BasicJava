package com.junrenge.servlet;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ValidateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> userNames = Arrays.asList("aaa","bbb","ccc");
		String msg = null;
		String username = request.getParameter("username");
		
		if(userNames.contains(username)){
			msg = "<font color='red'>���û���������<font>";
		}else{
			msg = "<font color='green'>���û�������<font>";
		}
		
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		response.getWriter().print(msg);
		
	}

}
