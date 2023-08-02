package p2023_08_02;

public class DivideZeroExceptionHandling {
    public static void main( String[] args ) {
    	
	// int type의 변수 선언
 	int b = 20;
	int a = 0;
	int c = 0;

	// 두 수의 나눗셈 결과를 구한다

	try {
		c = b/a;		// 예외 발생
		int total = a + b;
		int sub = b-a;
		
	} catch ( ArithmeticException ae ) {
		// 예외 메세지
		a = 2;
		c = b/a;
	}
		System.out.println( c );
    }
}

		