package p2023_07_21;

import java.util.Random;

public class RandomEx {

	public static void main(String[] args) {

//		java.util.Random r1 = new java.util.Random();
		// 이렇게도 가능하나 별로 좋은 방법은 아님

		Random r = new Random();
// api를 보면 필드는 없고
		// 기본생성자

		// 난수 발생 방법 : 1. Math.random()
		// 2. Random 클래스

		int n1 = r.nextInt(10); // 0~9
		System.out.println("n1=" + n1);
		int n2 = r.nextInt(45) + 1; // 1<=n2<45
		System.out.println("n2=" + n2);

		for (int i = 0; i <= 6; i++) {
			System.out.print(r.nextInt(45) + 1 + "\t");

		}
		System.out.println();

		int n3 = (int) (Math.random() * 45) + 1;
		System.out.println("n3=" + n3);

		for (int i = 0; i <= 6; i++) {
			int n4 = (int) (Math.random() * 45) + 1;
			System.out.print(n4 +"\t");
			
		}
	}

}
