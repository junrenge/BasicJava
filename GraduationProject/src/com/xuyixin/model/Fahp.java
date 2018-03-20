package com.xuyixin.model;

public class Fahp {
	//实体类主键
	private int id;
	//风险类型id集合
	private String riskids;
	//风险因素id集合
	private String factorids;
	//评价集id
	private String evaid;
	//判断矩阵
	private String judgem;
	//权重向量集合
	private String weights;
	//评价矩阵
	private String evam;
	//评价向量集合
	private String evavectors;
	//计算结果
	private String result;
	//选择信息
	private String arr;
	//计算类型，0为第一次计算，1为重新计算
	private String type;
	
	public Fahp() {
	}
	
	public Fahp(String riskids, String factorids, String evaid) {
		this.riskids = riskids;
		this.factorids = factorids;
		this.evaid = evaid;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getArr() {
		return arr;
	}

	public void setArr(String arr) {
		this.arr = arr;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRiskids() {
		return riskids;
	}

	public void setRiskids(String riskids) {
		this.riskids = riskids;
	}

	public String getFactorids() {
		return factorids;
	}

	public void setFactorids(String factorids) {
		this.factorids = factorids;
	}

	public String getEvaid() {
		return evaid;
	}

	public void setEvaid(String evaid) {
		this.evaid = evaid;
	}

	public String getJudgem() {
		return judgem;
	}

	public void setJudgem(String judgem) {
		this.judgem = judgem;
	}

	public String getWeights() {
		return weights;
	}

	public void setWeights(String weights) {
		this.weights = weights;
	}

	public String getEvam() {
		return evam;
	}

	public void setEvam(String evam) {
		this.evam = evam;
	}

	public String getEvavectors() {
		return evavectors;
	}

	public void setEvavectors(String evavectors) {
		this.evavectors = evavectors;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

}
