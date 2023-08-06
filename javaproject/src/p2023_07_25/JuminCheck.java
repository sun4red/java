package p2023_07_25;

import java.util.Scanner;

public class JuminCheck {

	public static void main(String[] args) {

		// 키보드로 주민번호를 입력받아서 남자인지, 여자인지를 판별하는 프로그램 작성
		// 단, 주민번호 앞자리는 6자리, 뒷자리는 7자리 인지를 유효성 검사를 한다.

		Scanner sc = new Scanner(System.in);

		// 예외가 발생할 수 있는 문장
		try {
			System.out.println("주민번호 앞자리를 입력하세요");
			String jumin1 = sc.nextLine();
			System.out.println("주민번호 뒷자리를 입력하세요");
			String jumin2 = sc.nextLine();

			String g = jumin2.substring(0, 1);
			// 주민번호 뒷자리 미입력 시 프로그램 중단
			// 예외처리 필요

			// 가장 먼저 만족하는 부분에서 빠져나온다.

			if (jumin1.equals("")) {
				System.out.println("주민번호 앞자리를 입력하세요");
			} else if (jumin1.length() != 6) {
				System.out.println("주민번호 앞자리 6자리를 입력하세요");
			} else if (jumin2.equals("")) {
				System.out.println("주민번호 뒷자리를 입력하세요.");
			} else if (jumin2.length() != 7) {
				System.out.println("주민번호 뒷자리 7자리를 입력하세요.");
			} else if (g.equals("1") || g.equals("3")) {
				System.out.println("남자입니다.");
			} else if (g.equals("2") || g.equals("4")) {
				System.out.println("여자입니다.");
			} else {
				System.out.println("똑바로 입력하세요");
			}
			// 예외 발생
		} catch (Exception e) {
			System.out.println("잘못된 정보입니다.");
			
		}
	}

}
