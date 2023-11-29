package p2023_07_18;

public class ArrayEx01 {

	public static void main(String[] args) {

		// 배열 : 동일한 자료형의 데이터를 저장하기 위한 정적인 자료구조
		// 변수 -> 배열 -> 자료구조(List) 확장확장

		// 1차원 배열 첫번째 형식 : 배열에 저장될 값이 정해져있지 않은 경우

		int[] score = new int[3];
//		자료형 배열 변수명 연산자 자료형[배열의 크기]

		// 힙메모리에 4byte 짜리 공간 3개가 만들어졌다!

		// int형 배열은 자동으로 0으로 초기화가 된다.
		System.out.println(score[0]);
		System.out.println(score[1]);
		System.out.println(score[2]);

		score[0] = 80;
		score[1] = 90;
		score[2] = 100;

		System.out.println(score[0]);
		System.out.println(score[1]);
		System.out.println(score[2]);

		// 1차원 배열 두번째 형식 : 배열 선언과 동시에 초기화를 할 때 주로 사용
		// (배열에 할당될 값이 정해져 있는 경우)

		// double 배열은 자동으로 0.0으로 초기화가 된다.
		double[] d = new double[3];
		System.out.println(d[0]);
		System.out.println(d[1]);
		System.out.println(d[2]);

		// char 배열은 초기화가 자동으로 되지 않는다.
		char[] c = new char[3];
		System.out.println(c[0]);
		System.out.println(c[1]);
		System.out.println(c[2]);

		// boolean 배열 false 값으로 초기화
		boolean[] b = new boolean[3];
		System.out.println(b[0]);
		System.out.println(b[1]);
		System.out.println(b[2]);

		// String 배열 초기화값 null(값이 없다)
		String[] str = new String[3];
		System.out.println(str[0]);
		System.out.println(str[1]);
		System.out.println(str[2]);

		str[0] = "자바";
		str[1] = "오라클";
		str[2] = "스프링";

		System.out.println(str[0]);
		System.out.println(str[1]);
		System.out.println(str[2]);

		int[] s = { 80, 90, 100 };
		System.out.println(s[0]);
		System.out.println(s[1]);
		System.out.println(s[2]);

		System.out.println("배열의 크기:" + s.length);

		// 속서이기 때문에 괄호가 없다.

		for (int i = 0; i < s.length; i++) {
			System.out.print(s[i] + "\t");
		}
		System.out.println();

		// int형에서 자동으로 형변환하여 출력
		double[] dd = { 3.01, 10.5, 42.195, 50 };
		for (int i = 0; i < dd.length; i++)
			System.out.println(dd[i] + "\t");

		char[] cc = { 'j', 'a', 'v', 'a', '자', '바' };

		for (int i = 0; i < cc.length; i++) {
			System.out.print(cc[i] + "\t");
		}
		System.out.println();

		boolean bb[] = { true, false };

		String[] str1 = { "자바", "오라클", "스프링", "파이썬", "텐스플로우" };
		String[] str2 = new String[] { "자바", "오라클", "스프링", "파이썬", "텐스플로우" };

		for (int i = 0; i < str1.length; i++) {
			System.out.println(str1[i] + "\t");

		}

	}

}
