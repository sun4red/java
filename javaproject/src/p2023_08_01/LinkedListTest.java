package p2023_08_01;

import java.util.*;

class LinkedListTest {
  public static void main(String[] args) {

//	  Queue q = new Queue();
	  // Queue 는 인터페이스 이기 때문에 자체적으로 객체 생성을 할 수 없다.
	  
    LinkedList myQue = new LinkedList();  
    myQue.offer("1-자바");              
    myQue.offer("2-C++");
    myQue.offer("3-API");
    myQue.offer("4-MFC");
        
    System.out.println(myQue.poll());
    System.out.println(myQue.poll());
    System.out.println(myQue.poll());
    System.out.println(myQue.poll());
    System.out.println(myQue.poll());
    // null return;
    // 큐가 비어있으면 null값을 리턴 에러나던데
    
    
    
//    while(myQue.peek() != null)        //큐가 비어있지 않다면
//      System.out.println(myQue.poll()); //큐에서 데이터를 꺼내온다.
  }  
 }    