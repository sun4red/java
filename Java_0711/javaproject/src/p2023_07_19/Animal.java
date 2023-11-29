package p2023_07_19;

public class Animal {

	// 사용자 정의 클래스

	int age; // 필드, 멤버변수, 전역변수 : 메소드 바깥에서 정의되는 변수
				// 어디서 정의되나
				// heap메모리 영역에 저장

	public Animal() { // 기본 생성자(Default Constructor)
						// 매개변수가 없는 생성자
						// 앞에 접근제어자만 올 수 있다!
		
		
		System.out.println("생성자 호출 성공");
	}

	public static void main(String[] args) {

		int a = 10; // 지역변수 : stack영역에 저장

		String str = new String("자바");

		Animal a1 = new Animal(); // 생성자 호출

//		System.out.println(age);
		// 힙메모리에 접근(참조)할수있도록 해야한다.

		a1.age = 5;
		System.out.println(a1.age);

		Animal a2 = new Animal();
		System.out.println(a2.age);
		
		if (a1== a2) {
			System.out.println("같은 주소");
		}
			else {
				System.out.println("다른 주소");
		}
	}
}
