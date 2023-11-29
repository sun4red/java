package p2023_07_13;

import java.util.Scanner;

public class Oper05 {
	public static void main(String[] args) {

		System.out.println("정수 2개를 입력 하세요?");
		
		// 클래스 객체를 생성할 때는 new 를 사용하여 생성 (String만 예외)
		// 표준입력장치 키보드로 입력받기위해 Scanner 객체 사용
		Scanner sc = new Scanner(System.in);
		// 메소드를..!
		// 다른 것도 있지만 Scanner 클래스가 사용하기 쉬움
		// 필드는 없고 생성자가 있다.
		// 메소드 newInt() 정수형태로 값을 받을 때 사용
		
		int n1 = sc.nextInt(); // 스페이스바 or 엔터키로 구분함
		int n2 = sc.nextInt(); // 정수형태로 입력을 받기 위해서 nextInt()메소드로 입력을 받는다.
		
		System.out.println("n1 : " + n1);
		System.out.println("n2 : " + n2);
		
		if( n1 > n2 ) {
			System.out.println(n1 + "이" + n2 + "보다 크다");
		} else {
			System.out.println(n2 + "이" + n1 + "보다 크다");
		}
		
		// System은 정적인 개체이기 때문에 뒤에 . 만 찍어도 사용할 수 있다.
		// PrintStream 클래스에 println과 같은게 있음
		
		
	}
}
