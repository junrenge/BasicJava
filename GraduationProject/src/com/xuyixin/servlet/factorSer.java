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
	
	//����RiskImplʵ����FactorImplʵ����ͨ��ʵ�ֵĽӿڷ�����ִ�ж����ݿ�Ĳ���
	RiskImpl ri = new RiskImpl();
	FactorImpl fi = new FactorImpl();
	
	//��ҳ���get����ͳһ��post�����д���
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	
	//����ҳ�洫�ݹ�����post���󣬸���method��������������Ĳ�ͬ����
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

	//���û�ѡ����Ϻ󣬽�ѡ��ķ������ص�id���ϴ�ŵ�session�У�Ϊ�����ģ�������׼��
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

	//����id������ʹ��FactorImpl��delete����ɾ��һ����������
	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		fi.delete(Integer.parseInt(id));
		search(req, resp);
	}

	//��Ӻ��޸Ĺ�����������������������ʱidΪ�գ���ʱ��FactorImpl�����save�������޸�ʱid��Ϊ�գ���ʱ��FactorImpl�����update����
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

	//��Ӻ��޸Ĺ�����������������������ʱidΪ�գ��޸�ʱid��Ϊ�գ���id��Ϊ��ʱ��FactorImpl�����ѯ����ת��factoredit.jspҳ��
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

	//��ѯfactor���е����м�¼����������ݵ�list����request���棬����factorshow.jsp���ҳ����ʾ
	private void search(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		List<Risk> risks = ri.getAll();
		List<Factor> factors = fi.getAll();
		List<RiskFactor> rfs = fi.getRF();
		req.setAttribute("rfs", rfs);
		req.getRequestDispatcher("/factor/factorshow.jsp").forward(req, resp);
	}

}

