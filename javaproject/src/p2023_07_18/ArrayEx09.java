package p2023_07_18;

public class ArrayEx09 {
	public static void main(String[] args) {
		// 객체 배열 : 객체를 참조하는 배열

		// String객체를 저장하기 위한 배열
		String[] strArray = new String[3];
		strArray[0] = "Java"; // String객체를 생성해서 객체배열에 저장
		strArray[1] = "Java"; //
		strArray[2] = new String("Java");

		// == : 주소값을 비교
		// equals() : 값을 비교
		
		
		System.out.println(strArray[0] == strArray[1]);
		System.out.println(strArray[0] == strArray[2]);
		System.out.println(strArray[0].equals(strArray[2]));
	}
}
