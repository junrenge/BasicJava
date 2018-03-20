package com.xuyixin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.jndi.url.dns.dnsURLContext;
import com.xuyixin.model.Constant;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class eval1Servlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		//得到message的二维数组
		int[][] m = new int[Constant.getRisktypeno()+1][Constant.getMaxelementno()+2];
		HttpSession session = req.getSession();
		JSONObject str = (JSONObject) session.getAttribute("message");
		JSONArray arr = JSONArray.fromObject(str.get("data"));
		for(int j = 0 ; j < arr.size() ; j++){
            JSONArray a =   (JSONArray) arr.get(j);
            for(int i = 0 ; i < a.size() ; i++){
                m[j][i] = (Integer)a.get(i);
            }
        }
		
		//得到4个权向量
		double [][] weight = new double[Constant.getRisktypeno()+1][];
		
		//只得到上三角形
		double [][] firstm = new double[m[3][0]-m[3][1]][m[3][0]-m[3][1]];
		int row, col;
		row = col = 0;
		for (int i = 1; i <= firstm.length; i++) {
			for (int j = i; j <= firstm.length; j++) {
				firstm[row][col++] = Double.parseDouble(req.getParameter("0"+i+j));
				if(col == m[3][0]-m[3][1]){
					row++;
					col=row;
				}
			}
		}
		firstm = getFullMatrix(firstm);
		weight[0] = calweight(firstm);
		
		for (int i = 0; i < Constant.getRisktypeno(); i++) {
			double [][] m1 = new double[m[i][0]-m[i][1]][m[i][0]-m[i][1]]; 
			row = col = 0;
			for (int j = 1; j <= m[i][0]; j++) {
				for (int k = j; k <= m[i][0]; k++) {
					if(!req.getParameter(i+1+""+j+k).equals("0") && !"".equals(req.getParameter(i+1+""+j+k))){
						m1[row][col++] = Double.parseDouble(req.getParameter(i+1+""+j+k));
						if(col == m[i][0]-m[i][1]){
							row++;
							col=row;
						}
					}
				}
			}
//			printm(m1);
			m1 = getFullMatrix(m1);
//			printm(m1);
			weight[i+1] = calweight(m1);
		}
//		printm(weight);
		
		session = req.getSession();
		JSONObject obj = new JSONObject();
		obj.put("data", weight);
		System.out.println("weight："+obj.toString());
		session.setAttribute("weight", obj);
		req.getRequestDispatcher("v1/evaluate2.jsp").forward(req, resp);
	}

	private double[] calweight(double[][] m1) {
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

	private void printm(double[][] m1) {
		for (int i = 0; i < m1.length; i++) {
			for (int j = 0; j < m1[i].length; j++) {
				System.out.print(m1[i][j]);
			}
			System.out.println();
		}
		System.out.println("***");
	}

	private double[][] getFullMatrix(double[][] m1) {
		for (int i = 0; i < m1.length; i++) {
			for (int j = i; j < m1.length; j++) {
				m1[j][i] = 1/m1[i][j];
			}
		}
		return m1;
	}
	
	
	
}
