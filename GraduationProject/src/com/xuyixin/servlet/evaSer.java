package com.xuyixin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.junrenge.impl.EvaImpl;
import com.junrenge.impl.RiskImpl;
import com.xuyixin.model.Eva;
import com.xuyixin.model.Risk;


public class evaSer extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	EvaImpl ri = new EvaImpl();
	
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
		}else if(method.equals("selectok")){
			selectok(req,resp);
		}
	}

	private void selectok(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("evaid");
		HttpSession s = req.getSession();
		s.setAttribute("evaid", id);
		req.getRequestDispatcher("fahp?method=search").forward(req, resp);
	}

	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		ri.delete(Integer.parseInt(id));
		search(req, resp);
	}

	private void save(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		Eva r = new Eva();
		r.setNames(req.getParameter("names"));
		r.setCredits(req.getParameter("credits"));
		r.setNum(req.getParameter("names").split(",|£¬").length+"");
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
			Eva r = new Eva();
			r = ri.get(Integer.parseInt(id));
			req.setAttribute("eva", r);
		}
		req.getRequestDispatcher("eva/evaedit.jsp").forward(req, resp);
	}

	private void search(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		List<Eva> risks = ri.getAll();
		req.setAttribute("evas", risks);
		req.getRequestDispatcher("/eva/evashow.jsp").forward(req, resp);
	}

}

