package com.xuyixin.model;

public class Constant {
	
	static int[] v = new int[]{4,3,2,1};
	//评价的个数
	static int vtype = 4;
	
	//风险类型共有3种
	static int risktypeno = 3;
	
	//每种风险类型最多有5个因素
	static int maxelementno = 5;
	
	//inner风险5个因素
	static int innerelementno = 5;
	
	//net风险3个因素
	static int netelementno = 3;
	
	//out风险3个因素
	static int outelementno = 3;
	
	
	public static int[] getV() {
		return v;
	}

	public static void setV(int[] v) {
		Constant.v = v;
	}

	public static int getVtype() {
		return vtype;
	}

	public static void setVtype(int vtype) {
		Constant.vtype = vtype;
	}

	public static int getInnerelementno() {
		return innerelementno;
	}

	public static void setInnerelementno(int innerelementno) {
		Constant.innerelementno = innerelementno;
	}

	public static int getNetelementno() {
		return netelementno;
	}

	public static void setNetelementno(int netelementno) {
		Constant.netelementno = netelementno;
	}

	public static int getOutelementno() {
		return outelementno;
	}

	public static void setOutelementno(int outelementno) {
		Constant.outelementno = outelementno;
	}

	public static int getRisktypeno() {
		return risktypeno;
	}

	public static void setRisktypeno(int risktypeno) {
		Constant.risktypeno = risktypeno;
	}

	public static int getMaxelementno() {
		return maxelementno;
	}

	public static void setMaxelementno(int maxelementno) {
		Constant.maxelementno = maxelementno;
	}
	
	
}
