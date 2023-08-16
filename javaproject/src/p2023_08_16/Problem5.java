package p2023_08_16;

public class Problem5 {
	public static void main(String[] args) {

		int a = 60, b = 24, result = 0;

		for (int i = b; i >= 1; i--) {

			if (a % i == 0 && b % i == 0) {
				result = i;
				break;
			}

		}
		System.out.println(a + ", " + b + "의 최대공약수 : " + result);

	}
}
