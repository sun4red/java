package p2023_07_28;

import java.util.Scanner;

public class Re {

	static void yoon(int year) {
		if (year % 4 == 0) {
			if (year % 400 == 0) {
				System.out.println("윤년");
			} else if (year % 100 == 0) {
				System.out.println("윤년이 아님");
			} else {
				System.out.println("윤년");
			}
		} else {
			System.out.println("윤년이 아님");
		}
	}

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		System.out.println("연도를 입력하세요.");
		int year = sc.nextInt();
		yoon(year);
	}

}
