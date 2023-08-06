package p2023_08_02;

public class DivideZeroExceptionHandling1 {
    public static void main( String[] args ) {
    	
	// int type의 변수 선언
 	int b = 20;
	int a = 0;
	int c = 0;

	// 두 수의 나눗셈 결과를 구한다

	try {
		c = b/a;
		int total = a + b;
		int sub = b-a;
		
	} catch ( Exception e ) { // 얘가 최상위
		a = 2;
		c = b/a;
		System.out.println("0으로 나눌수 없습니다.");
	}

		System.out.println( c );
    }
}

		