package p2023_07_17;

public class Break01 {
	public static void main(String[] args) {
		// 무한루프 : for문
		// break : 반복문을 빠져나오는 역할
		for (int i = 1;; i++) {
			System.out.println(i + "무한");
			if (i == 100)
				break;
		}
	}
}
