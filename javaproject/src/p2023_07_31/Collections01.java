package p2023_07_31;

import java.util.*;

class Collections01 {
	public static void main(String[] args) {

//		Set s = new Set();	// 오류 발생, 인터페이스라 자체 객체 생성불가

		Set set = new HashSet();		// 업캐스팅
//	HashSet	set = new HashSet();
		System.out.println("요소의 갯수->" + set.size());	// 처음엔 없어서 0
		
	//	boolean add (Object e)
		set.add("하나");		// add의 매개변수 Object, 업캐스팅 된다.boolean형으로 결과값 리턴
		set.add(2);			// 매개변수 최상위클래스 Object, 여러가지 자료형 저장 가능
		set.add(3.42);		// 업로드 하면서 업캐스팅 된다.
		set.add("넷");
		set.add("five");
		set.add(6);
		set.add(6);	// 중복된 값은 들어가지 않는다.
		System.out.println("요소의 갯수->" + set.size());
		System.out.println(set);
		// 순차적인 자료구조가 아님
		// 입력한 순서대로 나오지 않는다. 자료구조의 순서를 설정할 수 없음

		Iterator elements = set.iterator();
		while (elements.hasNext()) {
			System.out.println("\t\t" + elements.next());
		}

		/*
		 * Vector에만 적용 Enumeration enu = set.elements(); while( enu.hasMoreElements()){
		 * System.out.println( enu.nextElement() ); }
		 */
	}
}
