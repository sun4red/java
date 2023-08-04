package p2023_07_26;

class TestClass2 {
	private Object member;

	public void setValue(Object value) {
		member = value;
	}

	public Object getValue() {
		return member;
	}
}

class GenericTest02 {
	public static void main(String[] args) {
		TestClass2 obj01 = new TestClass2();

		// Object value = new Integer(3); 박싱 + 업캐스팅
		// Object value = 3; 자동박싱 + 업캐스팅

		obj01.setValue(3);
		System.out.println("되돌리는 값은->" + obj01.getValue());

		int n = ((Integer) (obj01.getValue())).intValue(); // .intValue 있으면 언박싱! 없으면 자동 언박싱!

		// Object value = new Double(3.4); 박싱+업캐스팅
		// Object value = 3.4; 자동박싱+업캐스팅
		obj01.setValue(3.4);
		System.out.println("되돌리는 값은->" + obj01.getValue());
		// 다운 캐스팅 + 언박싱
		double d1 = ((Double) (obj01.getValue())).doubleValue();
		double d2 = ((Double) (obj01.getValue()));

		// Object value = new String ("이해할 수 있다.");
		obj01.setValue("이해할 수 있다.");
		System.out.println("되돌리는 값은->" + obj01.getValue());

		// 다운 캐스팅
		String str = (String) obj01.getValue();
		// 앞에 자료형을 생략하면 오류가 난다...................
		// 문자열은 원래 heap 메모리에 저장되기 때문에 다운캐스팅만 있다.
		// 자동 언박싱은 없음
		
	}
}
