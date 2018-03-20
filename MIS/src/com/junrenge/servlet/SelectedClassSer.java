package com.junrenge.servlet;

import java.io.IOException;
import java.text.DecimalFormat;
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
public class SelectedClassSer extends HttpServlet{

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
		}else if(method.equals("searchone")){
			searchone(req,resp);
		}else if(method.equals("select")){
			select(req,resp);
		}else if(method.equals("writeonce")){
			writeonce(req,resp);
		}else if(method.equals("writeall")){
			writeall(req,resp);
		}else if(method.equals("searchmyclass")){
			searchmyclass(req,resp);
		}else if(method.equals("findmyselect")){
			findmyselect(req,resp);
		}
	}

	private void findmyselect(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sno = (String) req.getSession().getAttribute("sno");
		ClassImpl ci = new ClassImpl();
		String sql = "select class.* from class ,selectedclass where class.cno = selectedclass.cno and sno = '"+sno+"'";
		System.out.println(sql);
		List<Class> myselect = ci.getForList(sql, null);
		req.setAttribute("myselect", myselect);
		req.getRequestDispatcher("xuanke.jsp").forward(req, resp);
	}

	private void searchmyclass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Object sno =  req.getSession().getAttribute("sno");
		String grade = req.getParameter("grade");
		String term = req.getParameter("term");
		String sql = "select * from selectedclass where sno = '"+sno+"' and cno in (select cno from class where cno > '0' ";
		SelectedClassImpl sci = new SelectedClassImpl();
		if(!"".equals(grade) && grade != null){
			sql += "and cgrade = '"+grade+"' " ;
		}
		if(!"".equals(term) && term != null){
			sql += "and cterm = '"+term+"'" ;
		}
		sql += ")";
		System.out.println(sql);
		List<SelectedClass> list = (List<SelectedClass>) sci.getForList(sql, null);
		String gpa = "";
		double num1 = 0;
		double num2 = 0;
		boolean flag = true;
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i).getGrade() != null && !"".equals(list.get(i).getGrade())){
				num1 += Double.parseDouble(list.get(i).getGrade())*Double.parseDouble(list.get(i).getCredit());
				num2 += Double.parseDouble(list.get(i).getCredit());
			}else{
				flag = false;
				break;
			}
		}
		if(flag){
			DecimalFormat df = new DecimalFormat("#.00"); 
			gpa = df.format((num1*list.size())/(num2*100));
		}
		req.setAttribute("list", list);
		req.setAttribute("gpa", gpa);
		req.setAttribute("s1", grade);
		req.setAttribute("s3", term);
		req.getRequestDispatcher("chengji.jsp").forward(req, resp);
	}

	private void writeonce(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SelectedClassImpl sci = new SelectedClassImpl();
		ClassImpl ci = new ClassImpl();
		String cno = req.getParameter("cno");
		String sno = req.getParameter("sno");
		String grade = req.getParameter("grade");
		String tempsql = "select ccredit from class where cno = '"+cno+"'";
		String credit = ci.getForValue(tempsql, null);
		DecimalFormat df = new DecimalFormat("#.00");  
		String jidian = df.format((Double.parseDouble(grade)/10)-5);
		String cj = df.format(((Double.parseDouble(grade)/10)-5)*(Integer.parseInt(credit)));
		String sql = "update selectedclass set grade = ?,credit = ?,jidian = ?,cj = ? where cno = ? and sno = ?";
		sci.update(sql, grade,credit,jidian,cj,cno,sno);
		req.getRequestDispatcher("sc?method=searchone&cno="+cno).forward(req, resp);
	}
	
	private void writeall(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SelectedClassImpl sci = new SelectedClassImpl();
		String cno = req.getParameter("cno");
		String sno = req.getParameter("sno");
		String grade = req.getParameter("grade");
		String [] snos = sno.split(",");
		String [] grades = grade.split(",");
		sci.updateScs(snos, grades,cno);
		req.setAttribute("cno", cno);
		searchone(req, resp);
	}

	private void select(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		ClassImpl ci = new ClassImpl();
		SelectedClassImpl sci = new SelectedClassImpl();
		String [] ids = req.getParameterValues("selectedclass");
		String type = req.getParameter("type");
		Object sno =  req.getSession().getAttribute("sno");
		Object sname = req.getSession().getAttribute("sname");
		Object tno =  req.getSession().getAttribute("tno");
		Object tname = req.getSession().getAttribute("tname");
		for (int i = 0; i < ids.length; i++) {
			Class c  = ci.get(ids[i]);
			SelectedClass sc = new SelectedClass();
			sc.setCno(c.getCno());
			sc.setCname(c.getCname());
			if(type.equals("1")){
				sc.setTno(String.valueOf(tno));
				sc.setTname(String.valueOf(tname));
			}else if(type.equals("2")){
				sc.setSno(String.valueOf(sno));
				sc.setSname(String.valueOf(sname));
			}
			sci.save(sc);
		}
	}

	private void search(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		SelectedClassImpl sc = new SelectedClassImpl();
		Object tno =  req.getSession().getAttribute("tno");
		String sql = "select * from selectedclass where tno='"+tno+"' group by cno";
		List<SelectedClass> list = (List<SelectedClass>) sc.getForList(sql, null);
		req.setAttribute("selectedclasses", list);
		req.getRequestDispatcher("luru.jsp").forward(req, resp);
	}
	
	private void searchone(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		SelectedClassImpl sc = new SelectedClassImpl();
		Object tno =  req.getSession().getAttribute("tno");
		String cno = req.getParameter("cno");
		String sql = "select * from selectedclass where sno != '' and cno = '"+cno+"'";
		List<SelectedClass> list = (List<SelectedClass>) sc.getForList(sql, null);
		req.setAttribute("lurus", list);
		req.getRequestDispatcher("luru2.jsp").forward(req, resp);
	}

}
