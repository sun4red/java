package p2023_08_11;

public class Problem5 {

	// 구구단 2단에서 9단까지 출력

	public static void main(String[] args) {

		for (int dan = 2; dan <= 9; dan++) {
			System.out.print("[" + dan + "단]\t");
		}
		System.out.println();

		for (int i = 1; i <= 9; i++) {

			for (int dan = 2; dan <= 9; dan++) {

				System.out.print(dan + "*" + i + "=" + (dan * i) + "\t");

			}
			System.out.println();

		}

	}

}
