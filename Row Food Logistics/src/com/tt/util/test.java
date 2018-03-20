package com.tt.util;

public class test {
	public static void main(String[] args) {
		int id = 1;
		String name = "zhao ting";
		String tname = "zhao ting";
		String sql = "insert into abc (id, name,tname) values ("+id+", '"+name+"','"+tname+"')";
		System.out.println("c:"+sql);
	}
}
