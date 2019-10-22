package com.bdi.test.test01;

import java.util.ArrayList;
import java.util.List;

public class Execute {

	public static void main(String[] args) {
		List<Food> menus = new ArrayList<Food>();
		Food.addMenu(menus, "치킨1", 10000,"JMT1");
		Food.addMenu(menus, "치킨",20000,"JMT");
		
	 for(Food f:menus) {
		 System.out.println(menus);
	 }
		 
		
	}
}
