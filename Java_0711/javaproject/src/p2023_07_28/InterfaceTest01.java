package p2023_07_28;

interface IHello01{				// 인터페이스
  void sayHello(String name);
}

// 1. 인터페이스를 상속 받을때는 implements로 상속 받는다.
// 2. 부모 인터페이스를 상속을 받으면, 부모 인터페이스 안에 있는 추상메소드를
// 자식구현 클래스에서 반드시 메소드 오버라이딩을 해야한다.


class Hello01 implements IHello01{    
  public void sayHello(String name){
//	void sayHello(String name){
      System.out.println(name+"씨 안녕하세요!");
   }
}





class InterfaceTest01{
  public static void main(String[] args) {
	  
//	  IHello ih = new IHello01(); // 오류 발생
	  // 인터페이스는 자체적으로 객체 생성을 할 수가 없다.
	  
	  
    Hello01 obj= new Hello01();
    obj.sayHello("홍길동");
	obj.sayHello("이순신");
  }   
}                
