package p2023_07_14;

import java.util.Scanner;

public class Switch01 {
	public static void main(String[] args) {

		// switch ~ case 문

		int s = 90;
		
		System.out.println("점수를 입력");
		
		Scanner sc = new Scanner(System.in);
		
		s = sc.nextInt();
			
		switch (s/10) {
		case 10:
		case 9:
			System.out.println("A학점");
			break;
		case 8:
			System.out.println("B학점");
			break;
		case 7:
			System.out.println("C학점");
			break;
		case 6:
			System.out.println("D학점");
			break;
		default:
			System.out.println("F학점");
		}
	}
}
