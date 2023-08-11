package p2023_08_11;

public class Problem4 {

	// 1부터 100의 정수 중 5의 배수의 합과 7의 배수의 합

	public static void main(String[] args) {

		int sum5 = 0;
		int sum7 = 0;

		for (int i = 1; i <= 100; i++) {

			if (i % 5 == 0) {
				sum5 += i;
			}

			if (i % 7 == 0) {
				sum7 += i;
			}

		}

		System.out.println("5의 배수의 합 : " + sum5);
		System.out.println("7의 배수의 합 : " + sum7);

	}

}
