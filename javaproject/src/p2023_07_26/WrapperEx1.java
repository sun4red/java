package p2023_07_26;

public class WrapperEx1 {

	public static void main(String[] args) {

		// Integer 클래스는 기본생성자를 지원하지않는다.
//		Integer num = new Integer(); // 기본생성자 형태 오류 발생	

		// 박싱(boxing) : heap 메모리를 박스로 생각하고, stack메모리에 저장된 10을
		// heap메모리에 복사하는 것.

		int n = 10; // 지역변수 (stack영역에 저장)
		Integer num01 = new Integer(n); // 박싱(boxing)

		// 언박싱(unboxing) : heap메모리(box)에 있는 데이터를 stack메모리영역으로 가져오는것

		int n01 = num01.intValue(); 	// 언박싱(unboxing)

		// 자료형 변환 : "20" --> 20
		String s = "20";

		Integer num02 = new Integer(s); // 박싱(boxing)

		int n02 = num02.intValue(); 	// 언박싱(unboxing)

	}

}
