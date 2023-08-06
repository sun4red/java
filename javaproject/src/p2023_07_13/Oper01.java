package p2023_07_13;

public class Oper01 {
	public static void main(String[] args) {
// 산술 연산자
// +, -, *, /, %(나머지)

		int a = 10, b = 3, c;
		// 변수를 여러개 선언할 때는 , 로 구분하여 작성
		// 줄을 바꿔쓰면 변수의 형태를 따로 작성해줘야함
		// 초기값 선언, 마지막 값만 기억, 값을 바꿀 수 있어서 Variable
		
		c = a + b;
		// 연산의 결과를 c 에 저장하라
		System.out.println("a + b = " + c );
		System.out.println("a + b = " + ( a + b ) );
		System.out.println("a - b = " + ( a - b ) );
		System.out.println("a * b = " + ( a * b ) );
		System.out.println("a / b = " + ( a / b ) );
		// int로 선언했기 때문에 같은 자료형인 int형으로 처리, 소수점 이하 없음
		System.out.println("a % b = " + ( a % b ) );
	}
}
