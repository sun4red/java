package p2023_07_13;

public class Oper03 {
	public static void main(String[] args) {

		// 비교 연산자 : >, >=, <, <=, ==, !=(같지않다.)
		// 비교 연산자의 결과가 참이면 true, 거짓이면 false 값을 리턴함
		
		int num1 = 10;
		int num2 = 10;
		// 지역변수들은 자동으로 초기화가 되지 않기 때문에 반드시 초기값이 주어져야함
				
		boolean result1 = (num1 == num2);
		boolean result2 = (num1 != num2);
		boolean result3 = (num1 <= num2);
		System.out.println("result1: " + result1);
		System.out.println("result2: " + result2);
		System.out.println("result3: " + result3);
		
		System.out.println(num1 < num2);
		
		char c1 = 'A'; // 65 (10진수 아스키코드값)
		char c2 = 'B'; // 66
		boolean result4 = (c1 < c2);
		System.out.println("result4: " + result4);
		
		
	}
}
