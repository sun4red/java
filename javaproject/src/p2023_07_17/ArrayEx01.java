package p2023_07_17;

public class ArrayEx01 {
	
	public static void main(String[] args) {
	
		// 배열 : 동일한 자료형의 데이터를 저장하기 위한 정적인 자료구조
		// 변수 -> 배열 -> 자료구조(List) 확장확장
		
		// 1차원 배열 첫번째 형식 : 배열에 저장될 값이 정해져있지 않은 경우

		int[] score = new int[3];
//		자료형 배열 변수명 연산자 자료형[배열의 크기]
		
		// 힙메모리에 4byte 짜리 공간 3개가 만들어졌다!
		
	// int형 배열은 자동으로 0으로 초기화가 된다.
		System.out.println(score[0]);
		System.out.println(score[1]);
		System.out.println(score[2]);
	
		score[0] = 80;
		score[1] = 90;
		score[2] = 100;
		
		System.out.println(score[0]);
		System.out.println(score[1]);
		System.out.println(score[2]);

		// 1차원 배열 두번째 형식 : 배열 선언과 동시에 초기화를 할 때 주로 사용
		//						(배열에 할당될 값이 정해져 있는 경우)
		
	
		
	}
}
