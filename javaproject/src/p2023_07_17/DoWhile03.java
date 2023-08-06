package p2023_07_17;

import java.util.Scanner;

public class DoWhile03 {
	public static void main(String[] args) {

		System.out.println("메세지를 입력하세요");
		System.out.println("프로그램을 종료하려면 q를 입력하세요");

		Scanner sc = new Scanner(System.in);
		String input;

		do {
			System.out.println(">");
			input = sc.nextLine(); // 문자로 입력받는다
			System.out.println("입력문자: " + input);

		} while (!input.equals("q"));	
		// equals 를 쓰면 괄호안의 값과 일치하면 true 값 출력
		// ! 를 붙여서 false 값을 만들어줘서 다른값을 입력했을 때 계속 false를 false, true 값 리턴
		// !false 가 되어 true, do 문장 반복 실행

		System.out.println("프로그램 종료");
		sc.close();
	}
}
