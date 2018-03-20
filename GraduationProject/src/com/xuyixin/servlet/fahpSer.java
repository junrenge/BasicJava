package com.xuyixin.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.catalina.Session;

import com.junrenge.impl.EvaImpl;
import com.junrenge.impl.FactorImpl;
import com.junrenge.impl.FahpImpl;
import com.junrenge.impl.RiskImpl;
import com.junrenge.util.StringCut;
import com.xuyixin.model.Eva;
import com.xuyixin.model.Factor;
import com.xuyixin.model.Fahp;
import com.xuyixin.model.Risk;
import com.xuyixin.model.RiskFactor;


public class fahpSer extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	RiskImpl ri = new RiskImpl();
	FactorImpl fi = new FactorImpl();
	EvaImpl ei = new EvaImpl();
	FahpImpl fahpi = new FahpImpl();
	
	public static void main(String[] args) {
		FactorImpl fi = new FactorImpl();
		Factor f = null;
		f = fi.get(1);
		System.out.println(f.getFname());
	}
	
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
		}else if(method.equals("delete")){
			delete(req,resp);
		}else if(method.equals("confirm")){
			confirm(req,resp);
		}else if(method.equals("tomatrix")){
			tomatrix(req,resp);
		}else if(method.equals("calweight")){
			calweight(req,resp);
		}else if(method.equals("calv")){
			calv(req,resp);
		}else if(method.equals("calover")){
			calover(req,resp);
		}else if(method.equals("history")){
			history(req,resp);
		}else if(method.equals("recal")){
			recal(req,resp);
		}
	}

	private void recal(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//清空session的内容，回主页
		HttpSession s = req.getSession();
		s.removeAttribute("evaid");
		s.removeAttribute("factorids");
		s.removeAttribute("fahpid");
		s.removeAttribute("arr");
		s.removeAttribute("weights");
		s.removeAttribute("v");
		s.removeAttribute("result");
		s.removeAttribute("type");
		//重新给session赋值，开始一个新的计算，即在fahp表中新插入一条元组，用户输入的值在一个页面显示完毕，方便修改
		Fahp f = fahpi.get(Integer.parseInt(req.getParameter("id")));
		f.setId(0);
		f.setType("1");
		fahpi.save(f);
		s.setAttribute("evaid", f.getEvaid());
		s.setAttribute("factorids", f.getFactorids());
		s.setAttribute("fahpid", fahpi.getFahpid());
		s.setAttribute("type", "1");
		//处理arr，得到String[][]类型的数组
		String [][] arr = stringToArr(f.getArr());
		String [][][] judgem = stringToArr2(f.getJudgem());
		s.setAttribute("arr", arr);
		req.setAttribute("judgem", judgem);
		req.getRequestDispatcher("fahp/fahpmatrix.jsp").forward(req, resp);
	}

	private void history(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Fahp> fahps = fahpi.getAll();
		req.setAttribute("fahps", fahps);
		req.getRequestDispatcher("fahp/history.jsp").forward(req, resp);
	}

	private void calover(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//清空session的内容，回主页
		HttpSession s = req.getSession();
		s.removeAttribute("evaid");
		s.removeAttribute("factorids");
		s.removeAttribute("fahpid");
		s.removeAttribute("arr");
		s.removeAttribute("weights");
		s.removeAttribute("v");
		s.removeAttribute("result");
		s.removeAttribute("type");
		resp.sendRedirect("factor?method=search");
	}

	private void calv(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//获得选择信息
		HttpSession s = req.getSession();
		String [][] arr = (String[][]) s.getAttribute("arr");
		
		//最后的计算结果
		double [] result = new double[arr.length];
		
		//存放evam
		String [] evam = new String[arr.length];
		double [][] evavectors = new double[arr.length][];
		
		//获取评价集的值
		String evaid = (String) s.getAttribute("evaid");
		Eva e = ei.get(Integer.parseInt(evaid));
		String [] str = e.getCredits().split(",|，");
		double [] credits = stringTodouble(str);
		
		//获取权重矩阵
		double [][] weights = (double [][]) s.getAttribute("weights");
		
		//临时矩阵matrix，获取n个评价矩阵并计算风险因素评价向量
		double [][] matrix = null;
		for (int i = 1; i < arr.length; i++) {
			matrix = new double[arr[i].length][credits.length];
			for (int j = 1; j <= arr[i].length; j++) {
				for (int k = 1; k <= credits.length; k++) {
					matrix[j-1][k-1] = Double.parseDouble(req.getParameter(""+(i+1)+j+k));
				}
			}
			evavectors[i] = matrixToV(matrix, weights[i]);
			evam[i] = matrixToString(matrix);
		}
		//计算风险因素的各个得分
		for (int i = 1; i < evavectors.length; i++) {
			double sum = 0;
			for (int j = 0; j < evavectors[i].length; j++) {
				sum += evavectors[i][j]*credits[j];
			}
			result[i] = sum;
		}
		
		//计算总得分
		for (int i = 1; i < result.length; i++) {
			result[0] += result[i]*weights[0][i-1];
		}
		result = StringCut.cut(result);
		
		//更新数据库
		Fahp f = fahpi.get(Integer.parseInt(s.getAttribute("fahpid")+""));
		f.setEvam(matrixToString2(evam));
		f.setEvavectors(matrixToString2(evavectors));
		f.setResult(matrixToString(result));
		fahpi.update(f);
				
		//赋值，跳转
		s.setAttribute("v", evavectors);
		s.setAttribute("result", result);
		req.getRequestDispatcher("result.jsp").forward(req, resp);
	}

	private void calweight(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//得到选择的信息
		HttpSession s = req.getSession();
		String [][] arr = (String[][]) s.getAttribute("arr");
		
		//存放judgem的值，内容是三维数组
		String [] judgem = new String[arr.length];
		
		//存放weights矩阵,与arr同型
		double [][] weights = new double[arr.length][];
		
		//临时矩阵，获取n个判断矩阵的值
		double [][] matrix = null;
		for (int i = 0; i < arr.length; i++) {
			matrix = new double[arr[i].length][arr[i].length];
			for (int j = 1; j <= arr[i].length; j++) {
				for (int k = 1; k <= arr[i].length; k++) {
					matrix[j-1][k-1] = Double.parseDouble(req.getParameter(""+(i+1)+j+k));
				}
			}
			judgem[i] = matrixToString(matrix);
			weights[i] = matrixToWeight(matrix);
		}
		
		String evaid = (String) s.getAttribute("evaid");
		Eva e = ei.get(Integer.parseInt(evaid));
		String [] names = e.getNames().split(",|，");
		
		//更新数据库
		Fahp f = fahpi.get(Integer.parseInt(s.getAttribute("fahpid")+""));
		f.setJudgem((matrixToString(judgem)));
		f.setWeights(matrixToString(weights));
		fahpi.update(f);
		
		//赋值，跳转
		s.setAttribute("weights", weights);
		req.setAttribute("names", names);
		if(f.getEvam() != null){
			String [][][] evam = stringToArr2(f.getEvam());
			req.setAttribute("evam", evam);
		}
		req.getRequestDispatcher("fahp/fahpv.jsp").forward(req, resp);
	}

	private void tomatrix(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		HttpSession s = req.getSession();
		if(s.getAttribute("fahpid") != null){
			Fahp f = fahpi.get((Integer) s.getAttribute("fahpid"));
			String strrids = f.getRiskids();
			String [] rids = strrids.split(",");
			Integer [] riskids = new Integer [rids.length];
			for (int i = 0; i < rids.length; i++) {
				riskids[i] = Integer.parseInt(rids[i]);
			}
			List<Risk> rs = ri.get(riskids);
			
			String strfids = f.getFactorids();
			String [] ids = strfids.split(",");
			Integer [] fids = new Integer [ids.length];
			for (int i = 0; i < fids.length; i++) {
				fids[i] = Integer.parseInt(ids[i]);
			}
			List<Factor> fs = fi.get(fids);
			
			String [] temp = new String[rids.length];
			String [][] arr = new String [rids.length+1][];
			int index = 0;
			for (int i = 0; i < rs.size(); i++) {
				temp[index++] = rs.get(i).getName();
			}
			arr[0] = temp;
			
			for (int i = 0; i < rids.length; i++) {
				temp = new String[10];
				index = 0;
				for (int j = 0; j < fs.size(); j++) {
					if(fs.get(j).getRid().equals(rids[i])){
						temp[index++] = fs.get(j).getFname();
					}
				}
				List<String> tmp = new ArrayList<String>();
		        for(String str:temp){
		            if(str!=null && str.length()!=0){
		                tmp.add(str);
		            }
		        }
		        temp = tmp.toArray(new String[0]);
				arr[i+1] = temp;
			}
			
			//把选择信息arr放入数据库，方便再次计算
			f.setArr(matrixToString(arr));
			fahpi.update(f);
			s.setAttribute("arr", arr);
			req.getRequestDispatcher("fahp/fahpmatrix.jsp").forward(req, resp);
		}
	}

	private void confirm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//插入数据库，返回id，存入session
		HttpSession s = req.getSession();
		String rids = "";
		String str = (String) s.getAttribute("factorids");
		String evaid = (String) s.getAttribute("evaid");
		if(!"".equals(str) && !(s.getAttribute("factorids") == null)
				&& !"".equals(evaid) && !(s.getAttribute("evaid") == null)){
			String [] ids = str.split(",");
			Integer [] fids = new Integer [ids.length];
			for (int i = 0; i < fids.length; i++) {
				fids[i] = Integer.parseInt(ids[i]);
			}
			rids = fi.getRids(fids);
		}
		if(s.getAttribute("fahpid") == null){
			Fahp f = new Fahp(rids, str, evaid);
			f.setType("0");
			fahpi.save(f);
		}else{
			Fahp f = fahpi.get(Integer.parseInt(s.getAttribute("fahpid")+""));
			System.out.println("fahpid:"+s.getAttribute("fahpid"));
			f.setRiskids(rids);
			f.setFactorids(str);
			f.setEvaid(evaid);
			fahpi.update(f);
		}
		s.setAttribute("fahpid", fahpi.getFahpid());
		req.getRequestDispatcher("fahp?method=tomatrix").forward(req, resp);
	}

	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		fahpi.delete(Integer.parseInt(id));
		history(req, resp);
	}

	private void search(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		HttpSession s = req.getSession();
		String str = (String) s.getAttribute("factorids");
		if(!"".equals(str) && !(s.getAttribute("factorids") == null)){
			String [] ids = str.split(",");
			Integer [] fids = new Integer [ids.length];
			for (int i = 0; i < fids.length; i++) {
				fids[i] = Integer.parseInt(ids[i]);
			}
			List<RiskFactor> rfs = fi.getRF(fids);
			req.setAttribute("rfs", rfs);
		}
		
		String evaid  = (String) s.getAttribute("evaid");
		if(!"".equals(evaid) && !(s.getAttribute("evaid") == null)){
			Eva eva = ei.get(Integer.parseInt(evaid));
			req.setAttribute("eva", eva);
		}
		req.getRequestDispatcher("/fahp/fahpshow.jsp").forward(req, resp);
	}
	
	private void print(String[][] arr) {
		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr[i].length; j++) {
				System.out.print(arr[i][j] + " ");
			}
			System.out.println();
		}
	}
	
	private void print(double[][] arr) {
		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr[i].length; j++) {
				System.out.print(arr[i][j] + " ");
			}
			System.out.println();
		}
	}

	private String matrixToString(String[] matrixs) {
		String temp = "";
		for (int i = 0; i < matrixs.length; i++) {
			temp = temp + matrixs[i] + "*";
		}
		return temp;
	}
	
	private String matrixToString2(String[] matrixs) {
		String temp = "";
		for (int i = 1; i < matrixs.length; i++) {
			temp = temp + matrixs[i] + "*";
		}
		return temp;
	}
	
	private String matrixToString(double[] matrixs) {
		String temp = "";
		for (int i = 0; i < matrixs.length; i++) {
			temp = temp + matrixs[i] + ",";
		}
		return temp;
	}

	private double[] matrixToWeight(double[][] m1) {
		int i,j;
		double sum = 0;
		for (i = 0; i < m1.length; i++) {
			for (j = 0; j < m1.length; j++) {
				sum += m1[j][i];
			}
			for (j = 0; j < m1.length; j++) {
				m1[j][i] = m1[j][i]/sum;
			}
		}
		
		double [] w = new double[m1.length];
		for (i = 0; i < m1.length; i++) {
			for (j = 0; j < m1.length; j++) {
				w[i] +=m1[i][j];
			}
		}
		
		sum = 0;
		for (i = 0; i < w.length; i++) {
			sum += w[i];
		}
		for (i = 0; i < w.length; i++) {
			w[i] = w[i]/sum;
		}
		
		return w;
	}

	private String matrixToString(double[][] matrix) {
		String temp = "";
		for (int i = 0; i < matrix.length; i++) {
			for (int j = 0; j < matrix[i].length; j++) {
				temp = temp+matrix[i][j]+",";
			}
			temp += "#";
		}
		return temp;
	}
	
	private String matrixToString2(double[][] matrix) {
		String temp = "";
		for (int i = 1; i < matrix.length; i++) {
			for (int j = 0; j < matrix[i].length; j++) {
				temp = temp+matrix[i][j]+",";
			}
			temp += "#";
		}
		return temp;
	}
	
	private String matrixToString(String[][] matrix) {
		String temp = "";
		for (int i = 0; i < matrix.length; i++) {
			for (int j = 0; j < matrix[i].length; j++) {
				temp = temp+matrix[i][j]+",";
			}
			temp += "#";
		}
		return temp;
	}

	private double[] matrixToV(double[][] vm, double[] ds) {
		double [] rs = new double[vm[0].length];
		double sum = 0;
		int i,j;
		for (i = 0; i < vm[0].length; i++) {
			for (j = 0; j < ds.length; j++) {
				sum += ds[j]*vm[j][i];
			}
			rs[i] = sum;
			sum = 0;
		}
		//归一化
		sum = 0;
		for (i = 0; i < rs.length; i++) {
			sum += rs[i];
		}
		for (i = 0; i < rs.length; i++) {
			rs[i] = rs[i]/sum;
		}
		return rs;
	}

	private double[] stringTodouble(String[] names) {
		double [] temp = new double[names.length];
		for (int i = 0; i < names.length; i++) {
			temp[i] = Double.parseDouble(names[i]);
		}
		return temp;
	}

	private String[][] stringToArr(String str) {
		//字符串到二维数组，分隔符是,和#
		String [] a = str.split("#");
		String [][] arr = new String[a.length][];
		for (int i = 0; i < arr.length; i++) {
			String [] b = a[i].split(",");
			arr[i] = b;
		}
		return arr;
	}

	private String [][][] stringToArr2(String str){
		String [] a = str.split("[*]");
		String [][][] arr = new String[a.length][][];
		for (int i = 0; i < arr.length; i++) {
			String [][] b = stringToArr(a[i]);
			arr[i] = b;
		}
		return arr;
	}

}

