package com.junrenge.util;

public class StringCut {
	
	public static String cut(String a){
		if(a.length() > 5){
			a = a.substring(0, 5);
		}
		return a;
	}
	
	public static double[] cut(double[] a){
		for (int i = 0; i < a.length; i++) {
			a[i] = Double.parseDouble(StringCut.cut(a[i]+""));
		}
		return a;
	}

}
