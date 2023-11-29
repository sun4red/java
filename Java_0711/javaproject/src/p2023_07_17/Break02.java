package p2023_07_17;

public class Break02 {
	public static void main(String[] args) {
		// 무한루프 : while문
		// break : 반복문을 빠져나오는 역할

		// 무한루프는 for문 보다는 while문이 주로 사용된다.

		int i = 1;

		while (true) {
			System.out.println(i + "무한출력");
			if (i == 100) break;
			// 의미있는 결과를 처리를 해야하니 보통 if문이랑 같이 사용한다.
			i++;
		}
	}
}
