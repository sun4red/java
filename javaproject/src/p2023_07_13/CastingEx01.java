package p2023_07_13;

public class CastingEx01 {
	public static void main(String[] args) {

		// 서로다른 자료형의 변수를 산술연산을 수행하면 가장 큰 자료형으로 자동 형변환이 된다.

		byte value1 = 10;
		int value2 = 100;
		long value3 = 1000L;
		long result = value1 + value2 + value3;
		System.out.println(result);

		int i = 100;
		double d = 3.14;
		double result2 = i + d;
		System.out.println(result2);
		
		int total = 93;
		System.out.println(total / 5);
		double result3 = total / 5;
		// 자동 형변환 int -> double
		// 같은 자료형의 변수를 산술연산하면 같은 자료형 값으로 나옴
		// 소수점 이하 버림
		
		// 서로다른 자료형의 변수를 산술연산을 수행하면 가장 큰 자료형으로 자동 형변환이된다.
		double result4 = total / 5.0;
		System.out.println(result3);
		System.out.println(result4);

	}
}
