package p2023_07_18;

public class ArrayEx02 {

	public static void main(String[] args) {

		int[] scores = { 83, 90, 87 };

		System.out.println("score[0] : " + scores[0]);
		System.out.println("score[1] : " + scores[1]);
		System.out.println("score[2] : " + scores[2]);

		int sum = 0;
		for (int i = 0; i < 3; i++) {
			sum += scores[i];

		}
		System.out.println("총합 : " + sum);
		double avg = (double) sum / 3;  // 강제 형변환
		System.out.println("평균 : " + avg);

		// 평균값을 소수점 둘째자리까지 출력
		System.out.printf("평균 : %.2f",avg);
		
	}

}
