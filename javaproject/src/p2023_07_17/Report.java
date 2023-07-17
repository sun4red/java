package p2023_07_17;

import java.util.Scanner;

public class Report {

	static String f(int n) {

		int result = 1;
		String s = new String(n + "! = ");
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
		s = s + " = ";
		return s + result;

	}

	public static void main(String[] args) {

		System.out.println("정수를 입력하세요");

		Scanner sc = new Scanner(System.in);

		int n1 = sc.nextInt();

		System.out.println(f(n1));

	}
}
