package p2023_07_12;

public class VariableEx02 {
	public static void main(String[] args) {

		int v1 = 15;
		if (v1 > 10) {
			int v2;
			// v2 는 if문 안에서 정의된 지역변수 if문 안에서만 사용가능하다.
			v2 = v1 - 10;
			System.out.println(v2);
			
		}
//		int v3 = v1 + v2 + 5; // 에러 발생  if 문 밖에서 v2 사용 불가

		System.out.println(v1);
//		System.out.println(v3);
		
		// 지역변수 (Local variable) : 스택 영역에 저장
		// 1. 메소드 안에서 정의되는 변수
		// 2. 매개 변수(parameter) : 메소드 괄호안에서 사용되는 변수
		// 3. 블럭문(조건문, 반복문) 안에서 사용되는 변수
	}
}
