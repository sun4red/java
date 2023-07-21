package p2023_07_20;

class StaticTest4{
  private static int a=10;
  private int b=20;
  public static void printA(){  
    System.out.println(a);         
//    System.out.println(b);   //컴파일 에러 발생
    // 정적메소드 안에는 정적 필드만 사용 가능하다.
  }

  public void printB(){        
    System.out.println(b);     
  }                           
}
public class StaticTest04 {
  public static void main(String[] args) {
	  // 정적 메소드는 정적 메소드를 가진 클래스명으로 dot(.)으로 접근해서 호출한다.
    StaticTest4.printA();  
    // 일반 메소드는 일반메소드를 가진 클래스명으로 객체를 생성해서 접근해야한다.
    StaticTest4 s1 = new StaticTest4();
    StaticTest4 s2 = new StaticTest4();
    s1.printB();
    s2.printB();
  }    
}    