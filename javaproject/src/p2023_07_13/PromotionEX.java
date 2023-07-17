package p2023_07_13;

public class PromotionEX {
	public static void main(String[] args) {
		
		byte byteValue = 10;
		int intValue = byteValue;
		System.out.println("intValue: " + intValue);
		
		char charValue = '가';
		intValue = charValue;
		System.out.println("intValue: " + intValue);
		// 유니코드는 세계 각국의 문자를 2Byte로 표현할 수 있는 숫자(0~65535)
		// 
		
		intValue = 50;
		long longValue = intValue;
		System.out.println("longValue: " + longValue);
		
		longValue = 100;
		float floatValue = longValue;
		System.out.println("floatValue: " + floatValue);
		
		floatValue = 100.5F;
		double doubleValue = floatValue;
		System.out.println("doubleValue: " + doubleValue);
		
	}
}
