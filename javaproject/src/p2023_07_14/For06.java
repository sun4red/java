package p2023_07_14;

public class For06 {
	public static void main(String[] args) {

		// 구구단 2단부터 9단까지 출력하는 프로그램
		
		
		// for문 안의 for문 -> 다중 for문
		for (int dan = 2; dan<=9 ; dan++) {
			System.out.println("["+dan+"단]");
			for (int i = 1; i<=9 ; i++) {
				System.out.println(dan + " * " + i + " = " + dan*i);
			}
			System.out.println();
		}
	}

}
