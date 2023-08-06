package p2023_07_18;

import java.util.Scanner;

public class Factorial {

	// 재귀함수 : 함수안에서 자기자신의 함수를 호출하는 함수
	static int fact(int n) {
		if(n<=1) {
			return 1;
		}
		return n * fact(n-1);
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("원하는 팩토리얼을 입력하세요?");
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt();
		
		int result = fact(n);
		System.out.println(n+"!="+ result);
		
	}

}
