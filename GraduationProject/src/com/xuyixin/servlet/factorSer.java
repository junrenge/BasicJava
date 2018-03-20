package com.xuyixin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import com.junrenge.impl.FactorImpl;
import com.junrenge.impl.RiskImpl;
import com.xuyixin.model.Factor;
import com.xuyixin.model.Risk;
import com.xuyixin.model.RiskFactor;


public class factorSer extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	//创造RiskImpl实例和FactorImpl实例，通过实现的接口方法来执行对数据库的操作
	RiskImpl ri = new RiskImpl();
	FactorImpl fi = new FactorImpl();
	
	//对页面的get请求统一到post请求中处理
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	
	//处理页面传递过来的post请求，根据method参数来决定请求的不同方法
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

	//当用户选择完毕后，将选择的风险因素的id集合存放到session中，为后面的模拟计算做准备
	private void selectok(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String [] ids = req.getParameterValues("factorids");
		String str = "";
		for (int i = 0; i < ids.length; i++) {
			str = str + ids[i] +",";
		}
		HttpSession s = req.getSession();
		s.setAttribute("factorids", str);
		req.getRequestDispatcher("fahp?method=search").forward(req, resp);
	}

	//根据id参数，使用FactorImpl的delete方法删掉一个风险因素
	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		fi.delete(Integer.parseInt(id));
		search(req, resp);
	}

	//添加和修改共用这个方法，区别在于添加时id为空，此时用FactorImpl对象的save方法，修改时id不为空，此时用FactorImpl对象的update方法
	private void save(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		Factor f = new Factor();
		f.setFname(req.getParameter("name"));
		f.setRid(req.getParameter("rid"));
		System.out.println(req.getParameter("name")+req.getParameter("rid"));
		if("".equals(id) || id.equals(null)){
			fi.save(f);
		}else{
			f.setId(Integer.parseInt(id));
			fi.update(f);
		}
		search(req, resp);
	}

	//添加和修改共用这个方法，区别在于添加时id为空，修改时id不为空，当id不为空时用FactorImpl对象查询，跳转到factoredit.jsp页面
	private void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		if(!"".equals(id) && !id.equals(null)){
			Factor r = new Factor();
			r = fi.get(Integer.parseInt(id));
			req.setAttribute("factor", r);
		}
		List<Risk> risks = ri.getAll();
		req.setAttribute("risks", risks);
		req.getRequestDispatcher("factor/factoredit.jsp").forward(req, resp);
	}

	//查询factor表中的所有记录，将存放内容的list放入request里面，传到factorshow.jsp这个页面显示
	private void search(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		List<Risk> risks = ri.getAll();
		List<Factor> factors = fi.getAll();
		List<RiskFactor> rfs = fi.getRF();
		req.setAttribute("rfs", rfs);
		req.getRequestDispatcher("/factor/factorshow.jsp").forward(req, resp);
	}

}

