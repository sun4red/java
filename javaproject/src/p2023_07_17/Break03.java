package p2023_07_17;

public class Break03 {
	public static void main(String[] args) {
		int i = 0;
		while (true) {
			i++;
			int num = (int) (Math.random() * 6) + 1;
			System.out.println(num);
			if (num == 6) {
				break;
			}
		}
		System.out.println("프로그램종료");
		System.out.println("루프횟수" + i);
	}
}
