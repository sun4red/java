package p2023_07_14;

public class For04 {
public static void main(String[] args) {
	
	// 1~100 까지 홀수, 짝수의 합을 구하는 프로그래 ㅁ작성
	// 단, for문 1개와 if~else문으로 작성
	
	int odd = 0, even = 0;
	
	for (int i = 1; i<=100; i++) {
		if (i%2==1) {
			odd += i;
		} else {
			even +=i;
		}
	}
	System.out.println("홀수 : " + odd + " 짝수 : " + even);
}
}
