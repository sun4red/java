package p2023_07_17;

public class Continue02 {
	public static void main(String[] args) {

		// continue문을 이용해서 1~100 중에 짝수만 출력

		for (int i = 1; i <= 100; i++) {
			if (i % 2 == 1)
				continue;
			System.out.println("짝수:" + i);
		}
	}
}
