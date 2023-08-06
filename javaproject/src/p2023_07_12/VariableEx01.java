package p2023_07_12;

public class VariableEx01 {
	// x, y 변수의 값을 서로 교환하는 예제
	public static void main(String[] args) {
		int x = 3;
		int y = 5;
		System.out.println("x : " + x + ", y : " + y);

		int temp = x; // temp에 x변수에 있는 값을 할당 temp = 3
		x = y; // x에 y변수에 있는 값을 할당 x = 5
		y = temp; // y에 temp변수에 있는 값을 할당 y = 3
		System.out.println("x : " + x + ", y : " + y);
	}
}
