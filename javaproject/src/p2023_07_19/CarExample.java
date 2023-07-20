package p2023_07_19;

class Car { // public이 붙으면 에러가남
	String company = "현대자동차";
	String model = "그랜져";
	String color = "검정";
	int maxSpeed = 350;
	int speed;

}

public class CarExample {

	public static void main(String[] args) {

		Car myCar = new Car();
		// 새롭게 myCar의 값이 초기화 된다...!

		System.out.println("제작회사 : " + myCar.company);
		System.out.println("모델명 : " + myCar.model);
		System.out.println("색깔 : " + myCar.color);
		System.out.println("최고속도 : " + myCar.maxSpeed);
		System.out.println("현재속도 : " + myCar.speed);

		// 필드값 변경
		myCar.speed = 60;

		System.out.println("수정된 속도 : " + myCar.speed);
	}

}
