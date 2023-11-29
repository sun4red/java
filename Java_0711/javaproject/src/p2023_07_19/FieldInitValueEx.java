package p2023_07_19;

class FieldInitValue {
	// 생성자! 클래스로부터 new 연산자로 객체를 생성할 때 호출되어
	// 객채의 초기화를 담당!

	byte byteField; 		// 정수형 : 0으로 초기화
	short shortField;
	int intField;
	long longField;

	boolean booleanField; 	// false 로 초기화
	char charField;

	float floatField; 		// 실수형 : 0.0으로 초기화
	double doubleField;

	int[] arrField; 		// null로 초기화
	String stringField;

}

public class FieldInitValueEx {
	public static void main(String[] args) {
		// 메인은 퍼블릭 클래스랑 이름을 일치시켜야함

		FieldInitValue fiv = new FieldInitValue();
		// new 쓸때 heap 메모리에 새로 할당!

		System.out.println("byteField:" + fiv.byteField);
		System.out.println("shortField:" + fiv.shortField);
		System.out.println("intField:" + fiv.intField);
		System.out.println("longField:" + fiv.longField);
		System.out.println("booleanField:" + fiv.booleanField);
		System.out.println("charField:" + fiv.charField);
		System.out.println("floatField:" + fiv.floatField);
		System.out.println("doubleField:" + fiv.doubleField);
		System.out.println("arrField:" + fiv.arrField);
		System.out.println("stringField:" + fiv.stringField);

	}
}
