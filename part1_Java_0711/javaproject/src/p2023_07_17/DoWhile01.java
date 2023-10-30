package p2023_07_17;

public class DoWhile01 {
	public static void main(String[] args) {

		int i = 1;

		// 사용할 변수를 do while 문 위에 선언
		// do while 문은 무조건 1번은 실행 (조건문이 거짓이어도 1회는 실행)

		do {
			System.out.println(i + "사랑해요~!!");
			i++;
		} while (i <= 10); // 조건식
	}
}
