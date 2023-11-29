package p2023_08_01;

import java.util.*;

class HashTableTest {
	public static void main(String[] args) {

//	Map ht = new Hashtable();		// 업캐스팅  상속해준 메소드만 사용할 수 있다.
// 업캐스팅이 되면 상속된 메소드만 사용 가능 -> 참조가능한 영역 축소 keys()메소드 사용 불가
		
		
		
		// 1. 업캐스팅이 되면 참조 가능한 영역의 축소가 일어난다.
		// 2. 업캐스팅이 되면 부모가 상속해준 메소드만 사용이 가능하다.
		// 3. keys()메소드는 부모인 Map이 상속해준 메소드가 아니기 때문에
		//		업캐스팅 방식으로 Map객체를 생성하면 사용할 수 없다.
		

		Hashtable ht = new Hashtable();

		// 해쉬 테이블에 키/데이터를 입력한다.
		ht.put("딸기", "StrawBerry");
		ht.put("사과", "Apple");
		ht.put("포도", "Grapes");
		ht.put("참외", "Grapes");
		ht.put("count", 10);		// 자동박싱, 업캐스팅

		
		
		// 1. Key를 알고있는 경우
		// Object get(Object key)
		
		// 해쉬 테이블의 값을 키를 이용하여 얻는다.
		// Object obj = ht.get("포도");
		String Val = (String) ht.get("포도");		// 다운캐스팅
		if (Val != null) {
			System.out.println("포도-> " + Val);
		}
		
		String s = (String) ht.get("딸기");		// 다운캐스팅
		// Object를.. String으로 해서 다운캐스팅인가
		System.out.println(s);
		Integer it = (Integer) ht.get("count");
		System.out.println(it);
		int i = it.intValue();			// 언박싱
		System.out.println(i);
		
		int ii = ((Integer)ht.get("count")).intValue();	// 한줄로
		// 기본 자료형이 아니니 Integer 클래스로 다운캐스팅을 해야한다.
		System.out.println(ii);
		

		// 2. Key를 모르는 경우
		// 열거형 (Enumeration)
		Enumeration Enum = ht.keys();
		while (Enum.hasMoreElements()) {
			Object k = Enum.nextElement();
			Object v = ht.get(k);
			System.out.println(k + " : " + v);
		}
	}
}
