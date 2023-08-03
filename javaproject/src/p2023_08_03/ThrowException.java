package p2023_08_03;

public class ThrowException {

	// ArrayIndexOutOfBoundsException 배열의 범위를 벗어났을 때
	
	// throw new 예외클래스();
	// 프로그래머가 강제로 예외를 발생시키는 방법
	public void exceptionMethod()throws ArrayIndexOutOfBoundsException {
        // 배열 선언
		int[] intA = { 1, 2, 3, 4 };   

		// 배열의 저장된 값을 출력
		for( int i=0 ; i<10 ; i++ ) {
		    // 예외를 던짐(프로그래머가 예외를 발생시킴)
			// 예외를 발생시키는 코드
		  if( i == 2 ) throw new ArrayIndexOutOfBoundsException();
		  // 실제로 예외가 아닌데 예외를 발생시켜버림
		  // 예외 발생 시기 조절
			System.out.println( intA[i] );
		}
    }

    public static void main( String[] args ) {
		ThrowException te = new ThrowException();
	
	try {
	    te.exceptionMethod();
	} catch ( ArrayIndexOutOfBoundsException ab ) {
	    System.out.println( "배열의 index를 초과했습니다." );
	    ab.printStackTrace();
	}

    }//main() end
}