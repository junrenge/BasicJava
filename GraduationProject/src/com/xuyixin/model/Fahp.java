package com.xuyixin.model;

public class Fahp {
	//ʵ��������
	private int id;
	//��������id����
	private String riskids;
	//��������id����
	private String factorids;
	//���ۼ�id
	private String evaid;
	//�жϾ���
	private String judgem;
	//Ȩ����������
	private String weights;
	//���۾���
	private String evam;
	//������������
	private String evavectors;
	//������
	private String result;
	//ѡ����Ϣ
	private String arr;
	//�������ͣ�0Ϊ��һ�μ��㣬1Ϊ���¼���
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
