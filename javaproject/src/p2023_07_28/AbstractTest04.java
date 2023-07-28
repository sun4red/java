package p2023_07_28;

interface IHello{ 			// 부모 인터페이스
  /*public abstract 생략가능*/ void sayHello(String name);	// 추상 메소드
}
abstract class GoodBye04{ 	// 부모 추상 클래스
  public abstract void sayGoodBye(String name); 	// 추상 메소드
  // 얘는 지우면 안됨
}
// 클래스와 인터페이스를 동시에 상속을 받을 때는 클래스를 먼저 상속을 받고, 그런 다음에
// 인터페이스를 나중에 상속을 받아야한다.
class SubClass04 extends GoodBye04 implements IHello{
	// 추상클래스부터 상속받고, 인터페이스 
  public void sayHello(String name){
    System.out.println(name+"씨 안녕하세요!");
  }
  public void sayGoodBye(String name){
    System.out.println(name+"씨 안녕히 가세요!");
  }
} 
class AbstractTest04{
  public static void main(String[] args) {
	  
    SubClass04 test= new SubClass04();
    test.sayHello("써우넝");	// 메소드 오버라이딩된 메소드가 호출된다.
    test.sayGoodBye("써넝쓰");
  }   
}                          