package p2023_07_14;

import java.util.Scanner;

public class If02 {
	public static void main(String[] args) {

		System.out.println("정수 입력");

		int n;
		Scanner sc = new Scanner(System.in);

		n = sc.nextInt();

		if (n % 2 == 0) {
			System.out.println("짝수");
		} else {
			System.out.println("홀수");
		}
	}
}
 