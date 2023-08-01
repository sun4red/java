package p2023_08_01;

import java.util.*;

public class MapTest {
    public static void main( String[] args ) {
        //HashMap 객체 생성
    	
    	// Map은 인터페이스이기 때문에 자체적으로 객체 생성을 할 수 없다.
    	Map hm = new HashMap();
    	
    	
//        HashMap hm = new HashMap();
    	

    	// put(Object Key, Object Value)
    	
        //키와 데이터 쌍을 삽입
        hm.put( "woman", "gemini" );
        hm.put( "man", "johnharu" );
        hm.put( "age", new Integer(10) );
        hm.put( "city", "seoul" );
        hm.put( "city", "busan" );		// 키가 중복되면 마지막 값만 사용 가능
        
        //HashMap에 있는 객체들을 출력
        System.out.println( hm );
        
        //키 값만 출력
        System.out.println( hm.keySet() );
        
        //키를 이용해 해당 데이터를 출력
        // Object get(Object key)
        
        System.out.println( hm.get( "woman" ));
        System.out.println( hm.get( "city" ));
    }
}        
         
         
        