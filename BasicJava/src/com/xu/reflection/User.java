package com.xu.reflection;


public class User{
	public String name;
	private String age;
	
	public User(){
		
	}
	
	
	public User(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void show(){
		System.out.println(this.name+this.age);
	}
	
	public void show(String s){
		System.out.println(this.name+this.age);
	}
}

