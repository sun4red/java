package p2023_07_13;

import java.util.Scanner;

public class Oper06 {

	public static void main(String[] args) {

		
		// 조건 연산자
		
		// 키보드로 입력한 2개의 정수 중에서 최대값과 최소값을 구하는 프로그램 작성
		
		int n1, n2, max, min;
		System.out.println("정수 2개를 입력 하세요?");
		
		Scanner sc = new Scanner(System.in);
		
		n1 = sc.nextInt();
		n2 = sc.nextInt();
		
		System.out.println("n1 = " + n1);
		System.out.println("n2 = " + n2);
		
		
		// 변수 = (조건식) ? 값1 : 값2;
		// 조건식이 참이면 값1을 변수에 할당, 거짓이면 값2를 변수에 할당
		
		max = (n1 > n2) ? n1 : n2 ; // 최대값
		min = (n1 < n2) ? n1 : n2 ; // 최소값
		
		System.out.println("max : " + max);
		System.out.println("min : " + min);
				
	}
}
