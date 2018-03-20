package com.junrenge.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.junrenge.impl.StudentImpl;
import com.junrenge.model.Student;
/**
 * 对学生的逻辑处理
 * @author xu
 *
 */
public class StudentSer extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getParameter("method");
		if(method.equals("search")){
			search(req,resp);
		}
	}

	private void search(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		String sno = (String) req.getSession().getAttribute("sno");
		StudentImpl si = new StudentImpl();
		Student s = si.get(Integer.parseInt(sno));
		req.setAttribute("s", s);
		req.getRequestDispatcher("xueji.jsp").forward(req, resp);
	}

}
