package p2023_07_18;

import java.util.Scanner;

public class ArrayEx03 {

	public static void main(String[] args) {
		System.out.println("점수를 입력하세요");

		Scanner sc = new Scanner(System.in);

		int score[] = new int[5];
		int sum = 0;

		for (int i = 0; i <= 4; i++) {
			score[i] = sc.nextInt();
			sum += score[i];
		}
		double avg = (double) sum / 5;

		for (int j = 0; j <= 4; j++) {
			System.out.print(score[j] + "\t");
		}
		System.out.println();
		System.out.println("총합 : " + sum);
		System.out.printf("평균 : %.2f", avg);

	}
}
