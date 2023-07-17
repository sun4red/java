package p2023_07_14;

import java.util.Scanner;

public class Practice01_sh {
	public static void main(String[] args) {

		// 과제 01

		// 키보드로 정수 3개를 입력 받았을 때, 최대값과 최소값을 구하는 프로그램 작성
		// 단, if else 구문으로 작성

		Scanner sc = new Scanner(System.in);

		System.out.println("정수를 3개 입력, 최대값과 최소값 출력");

		int n1 = sc.nextInt();
		int n2 = sc.nextInt();
		int n3 = sc.nextInt();
		int max, min;

		if (n1 > n2 && n1 > n3) {
			if (n2 > n3) {
				max = n1;
				min = n3;
			} else {
				max = n1;
				min = n2;
			}
		} else if (n2 > n3 && n2 > n1) {
			if (n3 > n1) {
				max = n2;
				min = n1;
			} else {
				max = n2;
				min = n3;
			}
		} else {
			if (n1 > n2) {
				max = n3;
				min = n2;
			} else {
				max = n3;
				min = n1;
			}
		}
		System.out.println("최대값 : " + max + " 최소값 : " + min);
	}
}
