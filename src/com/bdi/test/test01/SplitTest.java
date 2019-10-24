package com.bdi.test.test01;

public class SplitTest {

	public static void main(String[] args) {
		String hobby = "study,movie,game";
		String[] hobbies =hobby.split(",");
		String hob1 ="study";
		System.out.println(hobby.indexOf(hob1));
		System.out.println(hobbies.length);
		System.out.println(hobbies[0]);
		/*
		 * for(int i=0;i<hobbies.length;i++) { System.out.println(hobbies[i]); }
		 */
		for(String str:hobbies) {
			if(str.equals(hob1)) {
				System.out.println("checked");
				break;
			}
		}
	}
}
