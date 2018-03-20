package com.xuyixin.servlet;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.catalina.Session;

import com.xuyixin.model.Constant;

public class SelectServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String [] inners = req.getParameterValues("inner");
		inners = minus(new String[]{"1","2","3","4","5"},inners);
		String [] nets = req.getParameterValues("net");
		nets = minus(new String[]{"1","2","3"},nets);
		String [] outs = req.getParameterValues("out");
		outs = minus(new String[]{"1","2","3"},outs);
		
		//第一个位置是没选的因素的个数，后面是具体有哪些因素没选
		int[][] m = new int[Constant.getRisktypeno()+1][Constant.getMaxelementno()+2];
		m[0][0] = Constant.getInnerelementno();
		m[0][1] = inners.length;
		for (int i = 0; i < inners.length; i++) {
			m[0][i+2] = Integer.parseInt(inners[i]);
		}
		
		m[1][0] = Constant.getNetelementno();
		m[1][1] = nets.length;
		for (int i = 0; i < nets.length; i++) {
			m[1][i+2] = Integer.parseInt(nets[i]);
		}
		
		m[2][0] = Constant.getOutelementno();
		m[2][1] = outs.length;
		for (int i = 0; i < outs.length; i++) {
			m[2][i+2] = Integer.parseInt(outs[i]);
		}
		
		m[3][0] = Constant.getRisktypeno();
		m[3][1] = 0;
		for (int i = 0; i < m[3][0]; i++) {
			m[3][i+2] = 0;
		}
		
		for (int i = 0; i < m.length; i++) {
			for (int j = 0; j < m[0].length; j++) {
				System.out.print(m[i][j]);
			}
			System.out.println();
		}
		
		HttpSession session = req.getSession();
		JSONObject obj = new JSONObject();
		obj.put("data", m);
		System.out.println("message:"+obj.toString());
		session.setAttribute("message", obj);
		req.getRequestDispatcher("/evaluate.jsp").forward(req, resp);
	}
	
	//计算两个字符串数组的差集
	public static String[] minus(String[] arr1, String[] arr2) { 
        LinkedList<String> list = new LinkedList<String>(); 
        LinkedList<String> history = new LinkedList<String>(); 
        String[] longerArr = arr1; 
        String[] shorterArr = arr2; 
        //找出较长的数组来减较短的数组 
        if (arr1.length > arr2.length) { 
            longerArr = arr2; 
            shorterArr = arr1; 
        } 
        for (String str : longerArr) { 
            if (!list.contains(str)) { 
                list.add(str); 
            } 
        } 
        for (String str : shorterArr) { 
            if (list.contains(str)) { 
                history.add(str); 
                list.remove(str); 
            } else { 
                if (!history.contains(str)) { 
                    list.add(str); 
                } 
            } 
        } 
                                           
        String[] result = {}; 
        return list.toArray(result); 
    }
}
