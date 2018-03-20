package com.xuyixin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.junrenge.impl.RiskImpl;
import com.xuyixin.model.Risk;


public class riskSer extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	RiskImpl ri = new RiskImpl();
	
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
		}else if(method.equals("edit")){
			edit(req,resp);
		}else if(method.equals("save")){
			save(req,resp);
		}else if(method.equals("delete")){
			delete(req,resp);
		}
	}

	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		ri.delete(Integer.parseInt(id));
		search(req, resp);
	}

	private void save(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		Risk r = new Risk();
		r.setName(req.getParameter("name"));
		System.out.println(req.getParameter("name"));
		if("".equals(id) || id.equals(null)){
			ri.save(r);
		}else{
			r.setId(Integer.parseInt(id));
			ri.update(r);
		}
		search(req, resp);
	}

	private void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		if(!"".equals(id) && !id.equals(null)){
			Risk r = new Risk();
			r = ri.get(Integer.parseInt(id));
			req.setAttribute("risk", r);
		}
		req.getRequestDispatcher("risk/riskedit.jsp").forward(req, resp);
	}

	private void search(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		List<Risk> risks = ri.getAll();
		req.setAttribute("risks", risks);
		req.getRequestDispatcher("/risk/riskshow.jsp").forward(req, resp);
	}

}

