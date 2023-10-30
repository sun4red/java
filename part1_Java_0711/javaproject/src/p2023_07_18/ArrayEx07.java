package p2023_07_18;

public class ArrayEx07 {
	public static void main(String[] args) {
		if (args.length != 2) {
			System.out.println("값의 수가 부족합니다.");

			System.exit(0); // 프로그램 강제종료
		}

		String strNum1 = args[0]; // args[0]="10"
		String strNum2 = args[1]; // args[1]="20"

		// int <-> String Wrapper 클래스(박싱과 언박싱)

		// 문자를 숫자로 형변환 : "20" --> 20
		int num1 = Integer.parseInt(strNum1);
		int num2 = Integer.parseInt(strNum2);

		int result = num1 + num2;
		System.out.println(num1 + "+" + num2 + "=" + result);

	}
}
