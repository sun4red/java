package p2023_07_14;

public class If01 {
	public static void main(String[] args) {

		// if 문 다음에는 반드시 괄호가 들어가야함
		if (10 > 5) {
			System.out.println("실행1");
		}

		// 실행되는 문장이 1줄인 경우에는 중괄호를 생략할 수 있다.
		if (10 > 5)
			System.out.println("실행2");

		if (true) {
			System.out.println("무조건 실행");
		}
		if (false) {
			System.out.println("실행안됨");
		}

		// if문에 중괄호가 없으면, if문 바로 아래 1줄만 if문의 적용을 받는다.
		if (10 > 30)
			System.out.println("실행 안됨!");
		System.out.println("조건식의 적용을 받지않고 실행됨");
		
	}
}
