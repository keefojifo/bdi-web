package com.bdi.test.test01;

import java.util.ArrayList;
import java.util.List;

public class Food {

	private String name;
	private int price;
	private String etc;
	
	public Food(String name,int price,String etc) {
		super();
		this.name = name;
		this.price = price;
		this.etc = etc;
	}
	
	@Override
	public String toString() {
		return "Food[name = "+name+",price=" + price+",etc="+etc+"]";
	}
	public static void addMenu(List<Food>menu,String name,int price,String etc) {
		Food f = new Food(name,price,etc);
		menu.add(f);
	}
	
	public static void main(String[] args) {
	
	
	}
}
