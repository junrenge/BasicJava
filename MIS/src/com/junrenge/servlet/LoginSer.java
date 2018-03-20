package com.junrenge.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.junrenge.impl.StudentImpl;
import com.junrenge.impl.TeacherImpl;
import com.junrenge.model.Student;
import com.junrenge.model.Teacher;

public class LoginSer extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		login(req,resp);
	}

	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		String CHECK_VALUE  = request.getParameter("CHECK_CODE_KEY_NAME");
		String CHECK_CODE_KEY = (String) request.getSession().getAttribute("CHECK_CODE_KEY");
		
		if(!CHECK_CODE_KEY.equalsIgnoreCase(CHECK_VALUE)){
			request.getSession().setAttribute("message", "验证码不正确，请重新输入！");
			response.sendRedirect(request.getContextPath()+"/login.jsp");
			return;
		}
		
		String sql = "";
		Student s = null;
		Teacher t = null;
		String loginname = request.getParameter("username");
		String loginpsw = request.getParameter("password");
		if(loginpsw.length() == 4){
			sql = "select * from student where sname = '"+loginname+"' and spw = '"+loginpsw+"'";
			StudentImpl si = new StudentImpl();
			s = si.getOne(sql);
		}else{
			sql = "select * from teacher where tname = '"+loginname+"' and tpw = '"+loginpsw+"'";
			TeacherImpl ti = new TeacherImpl();
			t = ti.getOne(sql);
		}
		if(s != null && !"".equals(s)){
			request.getSession().setAttribute("sname", s.getSname());
			request.getSession().setAttribute("sno", s.getSno());
			response.sendRedirect("stumain.jsp");
			return;
		}else if(t != null && !"".equals(t)){
			request.getSession().setAttribute("tname", t.getTname());
			request.getSession().setAttribute("tno", t.getTno());
			response.sendRedirect("stamain.jsp");
			return;
		}else{
			request.getSession().setAttribute("message", "用户名或密码不正确，请重新输入！");
			response.sendRedirect(request.getContextPath()+"/login.jsp");
			return;
		}
	}
}
