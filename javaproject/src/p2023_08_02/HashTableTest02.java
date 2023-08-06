package p2023_08_02;

import java.util.*;
class HashTableTest02{
  public static void main(String[] args) {
	  
	  
	  
	  
	  // 제네릭을 설정해서 Hashtable객체를 생성하고 있으며, key의 자료형은
	  // String형, value값의 자료형도 String형으로 설정되어 있다.
    Hashtable<String, String> ht= new Hashtable<String, String>( );
    ht.put("사과", "Apple");
    ht.put("딸기", "StrawBerry");
    ht.put("포도", "Grapes");         
    
    // 방법 1. key를 알고있는 경우에 사용하는 방법
    
    // 제네릭이 설정되어있으면, get()메소드로 key를 이용해 value값을 구한다.
    // 해쉬 테이블의 값을 키를 이용하여 얻는다.
    
    String Val = ht.get("포도");   // String 생략됨
    if(Val != null) {
      System.out.println("포도-> " + Val);
    }  
    
    // 방법 2. key를 모르는 경우
    Enumeration<String> Enum = ht.keys();  //해쉬 테이블의 키 요소들에 대한 Enumeration 객체 반환
    while(Enum.hasMoreElements()){     	//key가 있는경우 true 리턴
      String  k = Enum.nextElement();  
      String  v = ht.get(k);             
      System.out.println(k + " : "+ v ); 
    }
  }    
} 