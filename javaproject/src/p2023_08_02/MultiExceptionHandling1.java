package p2023_08_02;

public class MultiExceptionHandling1 {
    public static void main( String[] args ) {
		
    	// 1. try ~ catch ~ finally
    	// 1. finally 안에 들어있는 내용은 예외 발생여부와 상관없이 무조건 실행
    	// 2. finally 안에 들어가는 내용은 주로 파일을 닫거나, 데이터베이스 연결을 끊는 내용
    	// 		ex) file.close(), con.close()
    	
    	
    	
    	
    	
    	
    	
	int value = 20;
	int div = 0;

	int[] intArray = { 1, 2, 3 };

	try {
	    // 두수의 나눗셈을 구함
//	    int result = value / div;
//	    System.out.println( result );

	    // 배열의 특정 값을 저장
            int arrayValue = intArray[4];
			System.out.println( arrayValue );

	    } catch ( ArithmeticException ae ) {
			System.out.println( ae.toString() );

	    } catch ( ArrayIndexOutOfBoundsException ai ) {
			ai.printStackTrace();

	    } finally {
	    	System.out.println("예외가 발생했음!");

	    }	 
    }    
}



