package p2023_07_18;

import java.util.Scanner;

public class Report01 {
	public static void main(String[] args) {

		System.out.println("정수 5개를 입력하세요");

		Scanner sc = new Scanner(System.in);

		int max, min;
		int num[] = new int[5];

		for (int i = 0; i <= 4; i++) {
			num[i] = sc.nextInt();
		}
		max = num[0];
		min = num[0];
		for (int i = 1; i < num.length; i++) {
			if (max < num[i])
				max = num[i];
			if (min > num[i])
				min = num[i];
		}
		System.out.println("최대값 :" + max);
		System.out.println("최소값 :" + min);
	}
}
