package com.tt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tt.util.JDBCTools;

public class firstServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		JDBCTools jt = new JDBCTools();	
		System.out.println("haha");
		req.setCharacterEncoding("gb2312");
		String name = req.getParameter("username");
		String sql = "insert into abc (name) values ('"+name+"')";
		System.out.print(sql);
		jt.update(sql);
		PrintWriter out = resp.getWriter();
		out.println("ok");
	}

}
