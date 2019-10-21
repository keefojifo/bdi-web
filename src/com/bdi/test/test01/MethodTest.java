package com.bdi.test.test01;

class Mother {
	int a = 3;
	
	Mother(){
		System.out.println("내가 엄마니까 나먼저 실행");
	}

	public void test() {
		System.out.println("난 엄마꺼");;
	}
}

public class MethodTest extends Mother {

	int a =123; // 변수는 각각의 것(오버라이딩 개념이 아니다)
	/* 에러난다 왜냐하면 오버 라이딩 됬는데 리턴 타입이 달라서 
	 * public void test(int a, int b) { System.out.println(a + b); }
	 */
	/**
	 * 
	 */
	MethodTest(){
		super(); // 생략이 되어 있다.
		super.test(); //난 엄마꺼" 이걸 실행할 것이다.
		System.out.println(this.a);
		System.out.println("아닌데 내가 메모리 생성하니까 나먼저 실행");
	}
	public void test() {
		System.out.println("난 아들");
	}

	public static void main(String[] args) {
		Mother mt = new MethodTest(); //내가 엄마니까 나먼저 실행
		                              //아닌데 내가 메모리 생성하니까 나먼저 실행
		mt.test();
		System.out.println(mt.a);
	}
}
