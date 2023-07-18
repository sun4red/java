package p2023_07_17;

import java.util.Scanner;

public class Report {

	static String f(int n) {

		int result = 1;
		String s = new String(n + "! = ");

		if (n == 0) {
			s = s + 1;
		} else {
			for (int i = n;; i--) {
				result *= i;
				s = s + i;
				if (i >= 2) {
					s = s + " * ";
				}
				if (i == 1) {
					break;
				}
			}
		}
		s = s;
		return s + "\n" + "계산 값:" + result;

	}

	public static void main(String[] args) {

		System.out.println("정수를 입력하세요");

		Scanner sc = new Scanner(System.in);

		int n1 = sc.nextInt();

		System.out.println(f(n1));

	}
}
