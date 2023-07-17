package p2023_07_17;

public class MethodEx02 {
// 1~n 까지 합을 구하는 메소드

	static void sum(int n) {
		int hap = 0;
		for (int i = 1; i <= n; i++) {
			hap += i;
		}
		System.out.println("1~" + n + "=" + hap);
	}

	public static void main(String[] args) {
		sum(3);
		// 매개변수에 3이 전달되고... sum함수가 계산이됨
		sum(5);
		sum(10);
		sum(100);

	}
}
