package p2023_07_14;

public class While01 {
	public static void main(String[] args) {
		// While(조건식) {
		// 반복실행할 문장;
		// }

		// 조건식이 참일 경우에만 문장이 실행되고 거짓이면 실행되지않음

		// While문을 이용해서 사랑해요 메세지 10번 출력

		int i = 1;
		while (i <= 10) {
			System.out.println(i + "사랑해요");
			i++;
		}
	}
}
