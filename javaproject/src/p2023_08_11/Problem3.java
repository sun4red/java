package p2023_08_11;

public class Problem3 {

// 8의 약수를 구하는 문제

	public static void main(String[] args) {

		System.out.println("8의 약수");
		for (int i = 8; i > 0; i--) {

			if (8 % i == 0) {
				System.out.printf(i + "\t");
			}

		}

	}

}
