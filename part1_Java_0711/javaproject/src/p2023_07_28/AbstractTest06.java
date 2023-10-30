package p2023_07_28;

interface IHello06{
  int a=10; // 상수 public static final 생략
  public abstract void sayHello(String name);
}
interface IGoodBye06{
  public abstract void sayGoodBye(String name);
}

// 인터페이스 끼리 상속을 받을 때는 extends 로 상속을 받아야된다.
// 다중상속도 허용한다.
interface ITotal06 extends IHello06, IGoodBye06{
  public abstract void greeting(String name);
}

// 서브클래스에서 모두 메소드 오버라이딩을 시켜야한다.
// 인터페이스를 상속받는 구현클래스에서 3개의 추상메소드를 모두 메소드 오버라이딩해야힘
class SubClass06 implements ITotal06{
  public void sayHello(String name){
    System.out.println(name+"씨 안녕하세요!");
  }
  public void sayGoodBye(String name){
    System.out.println(name+"씨 안녕가세요!");
  }
  public void greeting(String name){
    System.out.println(name + ", 안녕!");
  }
}

class AbstractTest06{
  public static void main(String[] args) {
    SubClass06 test= new SubClass06();
    test.sayHello("썬썬");
    test.sayGoodBye("써넝");
    test.greeting("썬더치킨");
  }
}         