package com.junrenge.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.junrenge.model.Class;
import com.junrenge.model.SelectedClass;
import com.junrenge.impl.ClassImpl;
import com.junrenge.impl.SelectedClassImpl;
/**
 * 对学生的逻辑处理
 * @author xu
 *
 */
public class ClassSer extends HttpServlet{

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
		}else if(method.equals("select")){
			select(req,resp);
		}else if(method.equals("searchbykeyword")){
			searchbykeyword(req,resp);
		}else if(method.equals("edit")){
			edit(req,resp);
		}else if(method.equals("delete")){
			delete(req,resp);
		}else if(method.equals("create")){
			create(req,resp);
		}else if(method.equals("update")){
			update(req,resp);
		}else if(method.equals("check")){
			check(req,resp);
		}else if(method.equals("writeclassonce")){
			writeclassonce(req,resp);
		}else if(method.equals("table")){
			table(req,resp);
		}
	}

	private void table(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String grade = req.getParameter("grade");
		String clazz = req.getParameter("clazz");
		String term = req.getParameter("term");
		
		ClassImpl ci = new ClassImpl();
		if((!"".equals(grade) && grade != null)
				&&(!"".equals(clazz) && clazz != null)
					&&(!"".equals(term) && term != null)){
			String sql = "select * from class where id > 0 and cgrade ='"+grade+"' and cclass = '"+clazz+"' and cterm = '"+term+"'";
			System.out.println(sql);
			List<Class> table = ci.getForList(sql, null);
			req.setAttribute("t", table);
		}
		req.setAttribute("s1", grade);
		req.setAttribute("s2", clazz);
		req.setAttribute("s3", term);
		req.getRequestDispatcher("plan.jsp").forward(req, resp);
	}

	private void writeclassonce(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ClassImpl ci = new ClassImpl();
		String cid = req.getParameter("cid");
		String cweekday = req.getParameter("cweekday");
		String ctime = req.getParameter("ctime");
		String sql = "update class set cweekday = '"+cweekday+"' , ctime = '"+ctime+"' where id = "+cid;
		System.out.println(sql);
		ci.update(sql, null);
//		check(req, resp);
	}

	private void check(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Class>[] lists = new List[5];
		List<Class> temp = null;
		String grade = req.getParameter("grade");
		String clazz = req.getParameter("clazz");
		String term = req.getParameter("term");
		String sql = "select * from class where id > 0";
		ClassImpl ci = new ClassImpl();
		if(!"".equals(grade) && grade != null){
			sql =sql+ " and cgrade ='"+grade+"'";
		}
		if(!"".equals(clazz) && clazz != null){
			sql =sql+ " and cclass = '"+clazz+"'";
		}
		if(!"".equals(term) && term != null){
			sql =sql+ " and cterm = '"+term+"'";
		}
		for (int i = 1; i < 6; i++) {
			String tempsql = sql + " and cweekday = '"+i+"'";
			System.out.println(sql);
			temp = ci.getForList(tempsql, null);
			if(temp.size() == 3){
				lists[i-1] = temp;
			}else if(temp.size() == 2){
				if(temp.get(0).getCtime().equals(temp.get(1).getCtime())) lists[i-1] = temp;
			}
		}
		req.setAttribute("lists",lists);
		req.setAttribute("s1", grade);
		req.setAttribute("s2", clazz);
		req.setAttribute("s3", term);
		req.getRequestDispatcher("plan.jsp").forward(req, resp);
	}

	private void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ClassImpl ci = new ClassImpl();
		String id = req.getParameter("id");
		String cno = req.getParameter("cno");
		String  cname = req.getParameter("cname");
		String  cgrade = req.getParameter("cgrade");
		String  ctime = req.getParameter("ctime");
		String  cplace = req.getParameter("cplace");
		String  ccredit = req.getParameter("ccredit");
		String  ctype = req.getParameter("ctype");
		String  cweekday = req.getParameter("cweekday");
		String  ctag = req.getParameter("ctag");
		String  cclass = req.getParameter("cclass");
		String  cterm = req.getParameter("cterm");
		if(id == null || "".equals(id)){
			Class c = new Class(0, cno, cname, cgrade, ctime, cplace, ccredit, ctype, cweekday, ctag, cclass, cterm);
			ci.save(c);
		}else{
			Class c = new Class(Integer.parseInt(id), cno, cname, cgrade, ctime, cplace, ccredit, ctype, cweekday, ctag, cclass, cterm);
			ci.update(c);
		}
		searchbykeyword(req, resp);
	}

	private void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("edit.jsp").forward(req, resp);
	}

	private void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ClassImpl ci = new ClassImpl();
		String id = req.getParameter("id");
		req.setAttribute("c",ci.get(Integer.parseInt(id)));
		req.getRequestDispatcher("edit.jsp").forward(req, resp);
	}
	
	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ClassImpl ci = new ClassImpl();
		String id = req.getParameter("id");
		ci.delete(Integer.parseInt(id));
	}

	private void searchbykeyword(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		String cno = req.getParameter("cno");
		String cname = req.getParameter("cname");
		if(cno == null || "".equals(cno)){
			cno = "";
		}
		if(cname == null || "".equals(cname)){
			cname = "";
		}
		String sql = "SELECT * FROM class where cno like '%"+cno+"%' and cname like '%"+cname+"%'";
		ClassImpl ci = new ClassImpl();
		List<Class> list = ci.getForList(sql, null);
		req.setAttribute("all", list);
		req.setAttribute("cno", cno);
		req.setAttribute("cname", cname);
		req.getRequestDispatcher("clazz.jsp").forward(req, resp);
	}

//	private void searchall(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		ClassImpl ci = new ClassImpl();
//		List<Class> list = ci.getAll();
//		req.setAttribute("all", list);
//		req.getRequestDispatcher("clazz.jsp").forward(req, resp);
//	}

	private void select(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		ClassImpl ci = new ClassImpl();
		SelectedClassImpl sci = new SelectedClassImpl();
		String [] ids = req.getParameterValues("selectedclass");
		Object tno =  req.getSession().getAttribute("tno");
		Object tname = req.getSession().getAttribute("tname");
		for (int i = 0; i < ids.length; i++) {
			Class c  = ci.get(ids[i]);
			SelectedClass sc = new SelectedClass();
			sc.setCno(c.getCno());
			sc.setCname(c.getCname());
			sc.setTno(String.valueOf(tno));
			sc.setTname(String.valueOf(tname));
			sci.save(sc);
			c.setCtag("1");//表示有人授课
			ci.update(c);
		}
	}

	private void search(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		Object sno =  req.getSession().getAttribute("sno");
		Object tno = req.getSession().getAttribute("tno");
		String grade = req.getParameter("grade");
		String clazz = req.getParameter("clazz");
		String term = req.getParameter("term");
		String type = req.getParameter("type");
		ClassImpl ci = new ClassImpl();
		String sql="";
		String target = "";
		if(type.equals("1")){
			sql = "select * from class where cno not in (select cno from selectedclass where sno = '"+sno+"') ";
			target = "xuanke.jsp";
		}else if(type.equals("2")){
			sql = "select * from class where ctag = '0' ";
			target = "shouke.jsp";
		}else if(type.equals("4")){
			sql = "select * from class where id > 0 ";
			target = "peiyang.jsp";
		}else{
			sql = "select * from class where id > 0 ";
			target = "plan.jsp";
		}
		if(!"".equals(grade) && grade != null){
			sql =sql+ "and cgrade ='"+grade+"' ";
		}
		if(!"".equals(clazz) && clazz != null){
			sql =sql+ " and cclass = '"+clazz+"' ";
		}
		if(!"".equals(term) && term != null){
			sql =sql+ " and cterm = '"+term+"' ";
		}
		System.out.println(sql);
		List<Class> list = (List<Class>) ci.getForList(sql, null);
		req.setAttribute("classes", list);
		req.setAttribute("s1", grade);
		req.setAttribute("s2", clazz);
		req.setAttribute("s3", term);
		req.getRequestDispatcher(target).forward(req, resp);
	}

}
