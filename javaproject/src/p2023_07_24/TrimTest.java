package p2023_07_24;

public class TrimTest {

	
	// trim() 문자열 좌, 우의 공백을 없애줌
	// boolean equals() : 문자열 값 비교
	
    public static void main( String[] args ) {
	String str1 = new String( "gemini   " );
	String str2 = new String( "   gemini " );

	System.out.println( str1.equals( str2 ));
	System.out.println( str1.trim().equals( str2.trim()));
    }
}
		