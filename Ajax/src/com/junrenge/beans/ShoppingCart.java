package com.junrenge.beans;

import java.util.HashMap;
import java.util.Map;

public class ShoppingCart {
	
	private Map<String, ShoppingCartItem> items = new HashMap<String, ShoppingCartItem>();

	private String bookname;
	
	public void addToCart(String bookname, double price){
		this.bookname = bookname;
		if(items.containsKey(bookname)){
			ShoppingCartItem item = items.get(bookname);
			item.setNumber(item.getNumber()+1);
		}else{
			ShoppingCartItem item = new ShoppingCartItem();
			item.setBookname(bookname);
			item.setPrice(price);
			item.setNumber(1);
			
			items.put(bookname, item);
		}
	}
	
	public int getTotalNumber(){
		int total = 0;
		for (ShoppingCartItem item : items.values()) {
			total += item.getNumber();
		}
		return total;
	}
	
	public double getTotalPrice(){
		double total = 0;
		for (ShoppingCartItem item : items.values()) {
			total += item.getNumber()*item.getPrice();
		}
		return total;
	}
	
	public String getBookname(){
		return this.bookname;
	}
}
