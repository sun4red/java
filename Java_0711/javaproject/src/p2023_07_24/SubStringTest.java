package p2023_07_24;

// substring() : 전체 문자열에서 특정 범위의 문자를 추출하는 역할
// substring(int beginIndex) : beginIndex 번호부터 끝까지 문자를 추출
// substring(int beginIndex, int endIndex)
// : beginIndex 번호 부터 endIndex-1번 까지 문자를 추출


public class SubStringTest {
    public static void main( String[] args ) {
		
	String message = "Java program creates many objects.";
		
	String str1 = message.substring( 13 );
	System.out.println( str1 );

	String str2 = message.substring( 13, 16 );
	System.out.println( str2 );
    }
}
