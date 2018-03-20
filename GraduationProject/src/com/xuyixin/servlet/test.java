package com.xuyixin.servlet;

import java.util.LinkedList;

import com.sun.org.apache.xpath.internal.operations.Minus;

public class test {

	public static void main(String[] args) {
		
		double [] a = {1,2,3,4,5};
		a = normalization(a);
		for (int i = 0; i < a.length; i++) {
			System.out.println(a[i]+" ");
		}
//		double [][]m = {
//				{1,2,6},
//				{0.5,1,4},
//				{0.166666,0.25,1}
//		};
//		double []w = calweight(m);
//		for (int i = 0; i < w.length; i++) {
//			System.out.println(w[i]);
//		}
		
//		double [] temp = calv(m,w);
//		for (int i = 0; i < temp.length; i++) {
//			System.out.println(temp[i]);
//		}
		
//		String str = "内部风险,外部风险,合作风险,#销售,运输,财务,#外部因素1,外部因素2,#合作风险1,合作风险2,#";
//		printm(stringToArr(str));
//		String str2 = "111.0,112.0,113.0,#121.0,122.0,123.0,#131.0,132.0,133.0,#*211.0,212.0,213.0,#221.0,222.0,223.0,#231.0,232.0,233.0,#*311.0,#*411.0,#*";
//		printm(s(str2));
	}
	
	//最大最小归一化
	
	public static double [] normalization(double [] a){
		double min = a[0];
		double max = a[0];
		for (int i = 0; i < a.length; i++) {
			if(a[i] > max) max = a[i];
			if(a[i] < min) min = a[i];
		}
		for (int i = 0; i < a.length; i++) {
			a[i] = (a[i]-min)/(max-min);
		}
		return a;
	}
	
	private static String[][] stringToArr(String str) {
		//字符串到二维数组，分隔符是,和#
		String [] a = str.split("#");
		String [][] arr = new String[a.length][];
		for (int i = 0; i < arr.length; i++) {
			String [] b = a[i].split(",");
			arr[i] = b;
		}
		return arr;
	}
	
	private static String [][][] s(String str){
		String [] a = str.split("[*]");
		String [][][] arr = new String[a.length][][];
		for (int i = 0; i < arr.length; i++) {
			String [][] b = stringToArr(a[i]);
			arr[i] = b;
		}
		return arr;
	}
	
	private static double[] calv(double[][] vm, double[] ds) {
		double [] rs = new double[vm[0].length];
		double sum = 0;
		for (int i = 0; i < vm[0].length; i++) {
			for (int j = 0; j < ds.length; j++) {
				sum += ds[j]*vm[j][i];
			}
			rs[i] = sum;
			sum = 0;
		}
		return rs;
	}
	
	private static double[] calweight(double[][] m1) {
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
	
	private static void printm(double[][] m1) {
		for (int i = 0; i < m1.length; i++) {
			for (int j = 0; j < m1.length; j++) {
				System.out.print(m1[i][j]);
			}
			System.out.println();
		}
		System.out.println("***");
	}
	
	private static void printm(String[][] m1) {
		for (int i = 0; i < m1.length; i++) {
			for (int j = 0; j < m1[i].length; j++) {
				System.out.print(m1[i][j]);
			}
			System.out.println();
		}
		System.out.println("***");
	}
	
	private static void printm(String[][][] m1) {
		for (int k = 0; k < m1.length; k++) {
			for (int i = 0; i < m1[k].length; i++) {
				for (int j = 0; j < m1[k][i].length; j++) {
					System.out.print(m1[k][i][j]);
				}
				System.out.println();
			}
			System.out.println("***");
		}
	}
	
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
