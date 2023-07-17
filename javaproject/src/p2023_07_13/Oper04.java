package p2023_07_13;

public class Oper04 {

	public static void main(String[] args) {

		// String 변수 참조형
		// 값이 저장되는 건 heap메모리, 주소는 stack메모리
		
		String str1 = "자바";
		String str2 = "자바";
		// str2는 기존에 있던 heap 메모리의 "자바" 값 (str1이 갖고있는 것)을 리턴한다.
		String str3 = new String ("자바");
		// str3은 기존 것과 별도로 새로운 heap 메모리 공간에 저장
		
		// 비교연산자로 주소값을 비교
		
		if (str1 == str2) {
			System.out.println("같은 주소");  // 같은 주소
		}else {
			System.out.println("다른 주소");
		}
		if (str2 == str3) {
			System.out.println("같은 주소");
		}else {
			System.out.println("다른 주소");  // 다른 주소
		}

		// 값을 비교
		System.out.println(str1.equals(str2));
		System.out.println(str1.equals(str3));
		
	}
}
