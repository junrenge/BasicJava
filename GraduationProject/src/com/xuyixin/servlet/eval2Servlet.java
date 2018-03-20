package com.xuyixin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.xml.internal.bind.v2.runtime.reflect.opt.Const;
import com.xuyixin.model.Constant;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class eval2Servlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//得到4个权向量
		double [][] weight = new double [Constant.getRisktypeno()+1][];
		double [][] rsv = new double[Constant.getRisktypeno()+1][Constant.getVtype()];
		
		HttpSession session = req.getSession();
		JSONObject str = (JSONObject) session.getAttribute("weight");
		JSONArray arr = JSONArray.fromObject(str.get("data"));
		for(int j = 0 ; j < arr.size() ; j++){
            JSONArray a =   (JSONArray) arr.get(j);
            double [] temp = new double[a.size()];
            weight[j] = temp;
            for(int i = 0 ; i < a.size() ; i++){
                temp[i] = (double) a.get(i);
            }
        }
//		printm(weight);
		
		//得到4个评价矩阵
		JSONObject str2 = (JSONObject) session.getAttribute("message");
		JSONArray arr2 = JSONArray.fromObject(str2.get("data"));
		int row, col;
		for (int i = 0; i < weight.length; i++) {
			row = col = 0;
			double [][] vm = new double[weight[i].length][Constant.getVtype()];
			for (int j = 1; j <= (Integer)((JSONArray)arr2.get((i+3)%4)).get(0); j++) {
				for (int k = 1; k <= Constant.getVtype(); k++) {
					if(!req.getParameter(""+i+j+k).equals(1) && !"".equals(req.getParameter(""+i+j+k)) 
							&&!req.getParameter(""+i+j+k).equals(null)){
						vm[row][col++] = Double.parseDouble(req.getParameter(""+i+j+k));
					}
					if(col == Constant.getVtype()){
						row++;
						col=0;
					}
				}
			}
//			printm(vm);
			
			//计算vm与对应的权向量乘积得到1*4的向量，并放入最终的4*4的评价矩阵
			double [] vtemp = calv(vm,weight[i]);
			rsv[i] = vtemp;
		}
//		printm(rsv);
		
		//计算各个指标得分
		int [] v = Constant.getV();
		double [] result = new double [Constant.getRisktypeno()+1];
		for (int i = 1; i < rsv.length; i++) {
			for (int j = 0; j < rsv.length; j++) {
				result[i] = rsv[i][j]*v[j];
			}
		}
		//计算风险总得分
		for (int i = 1; i < result.length; i++) {
			result[0] += result[i]*weight[0][i-1];
		}
		
		//跳转到result.jsp页面
		session = req.getSession();
		JSONObject obj = new JSONObject();
		obj.put("data", rsv);
		System.out.println("rsv:"+obj.toString());
		session.setAttribute("rsv", obj);
		
		JSONObject obj2 = new JSONObject();
		obj2.put("data", result);
		System.out.println("result:"+obj2.toString());
		session.setAttribute("result", obj2);
		req.getRequestDispatcher("v2/result.jsp").forward(req, resp);
	}
	

	private double[] calv(double[][] vm, double[] ds) {
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

	private void printm(double[][] m1) {
		for (int i = 0; i < m1.length; i++) {
			for (int j = 0; j < m1[i].length; j++) {
				System.out.print(m1[i][j]);
			}
			System.out.println();
		}
		System.out.println("***");
	}
}
