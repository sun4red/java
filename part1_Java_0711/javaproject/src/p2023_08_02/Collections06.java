package p2023_08_02;

import java.util.*;

class Collections06 {
  public static void main(String[] args) {
    Vector<String> vec = new Vector<String>();

    
    // 제네릭을 쓰고있다.
	vec.add("Apple");
    vec.add("banana");
	vec.add("oRANGE");
//	vec.add(50);		// String형 데이터만 저장가능
	
	// 제네릭을 사용하게 되면 자료구조에서 데이터를 구해올때 제네릭으로 설정된 자료형은
	// 생략이 가능하다.
	String temp;
    for(int i=0; i<vec.size(); i++){
      temp=vec.get(i);  
      System.out.println(temp.toUpperCase());
    }
  } 
}                                                                                           
