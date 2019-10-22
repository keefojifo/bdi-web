package com.bdi.test.test01;

import java.util.ArrayList;
import java.util.List;

public class Member {

int a;
public String test(int a) {
	return "abc";
}

public static void changeMember(Member m) {
	m = new Member(); // 14줄에서 생성되서 16줄에서 없어지기 때문에  출력 0 의 값이 나온다
	m.a =10;
}
	public static void main(String[] args) {
		Member m = new Member();
		List<Member> mList = new ArrayList<Member>();
		m.a =10;
		mList.add(m);
		m.a =20;
		mList.add(m);
		m.a =30;
		mList.add(m);
		m.a =40;
		mList.add(m);
		
		for (int i = 0; i < mList.size(); i++) {
			System.out.println(mList.get(i).a);
		}
		
	}
}
