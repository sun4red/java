package p2023_07_14;

import java.util.Scanner;

public class While03 {
	public static void main(String[] args) {

		// 키보드로 입력한 구구단 1개 단을 while문으로 출력하는 프로그램 작성
		
		System.out.println("표시할 구구단의 단수 입력");
		
		Scanner sc = new Scanner(System.in);
	
		int dan = sc.nextInt() , i=1;
		while (i<=9) {
			System.out.println(dan + " * " + i + " = " + dan*i);
			i++;
		}
	}
}
