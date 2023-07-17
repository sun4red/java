package p2023_07_14;

import java.util.Scanner;

public class If03 {
	public static void main(String[] args) {

		// 키보드를 이용해서~ 정수 2개를 입력 받았을 때, 최대값과 최소값을 구하는 프로그램

		System.out.println("정수 2개 입력");

		int n1, n2, max, min;

		Scanner sc = new Scanner(System.in);

		// nexInt 변수를 사용하면 Int형태로 값을 가져온다. 어떤 형태가 필요한지에 따라 사용
		n1 = sc.nextInt();
		n2 = sc.nextInt();

		if (n1 > n2) {
			max = n1;
			min = n2;
		} else {
			max = n2;
			min = n1;
		}

		System.out.println("최대값 : " + max);
		System.out.println("최소값 : " + min);

	}
}
