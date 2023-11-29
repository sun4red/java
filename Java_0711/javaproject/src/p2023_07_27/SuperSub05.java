package p2023_07_27;

// 1. 메소드 재정의(Method Overriding)
// : 부모클래스로부터 상속받은 메소드를 자식클래스에서 재정의해서 사용하는 것.
// 2. 자식 클래스로 객체를 생성한 다음에 메소드를 호출하면, 메소드 오버라이딩 된 메소드만 호출된다.
// 3. 부모클래스의 상속해주는 메소드는 더 이상 사용할 수 없는 은닉 메소드가 된다.
// 4. 부모클래스의 은닉 메소드를 사용하기 위해서는 자식클래스에서
// super.parentPrn()형식으로 호출해서 사용할 수 있다.

class Parent05{
  public void parentPrn( ){
     System.out.println("슈퍼 클래스 : ParentPrn 메서드");  
  }
}
//Parent를 슈퍼 클래스로 하는 서브 클래스 Child 정의 
class Child05 extends Parent05{
  //슈퍼 클래스에 있는 ParentPrn 메서드를 오버라이딩하면 
  //Child로 선언된 객체는 슈퍼 클래스의 메서드가 은닉되어 상속 받지 못하게 된다. 
  public void parentPrn( ){
     System.out.println("서브 클래스 : ParentPrn 메서드");  
  }
  public void childPrn( ){
     System.out.println("서브 클래스 : ChildPrn 메서드");  
 }                                             
}

class SuperSub05{
  public static void main(String[] args){
    Child05 c = new Child05( );  	//서브 클래스로 객체를 생성
    c.parentPrn( );          	//오버라이딩된 서브 클래스의 메서드 호출 
    c.childPrn( );             	//서브 클래스 자기 자신의 메서드 호출
    System.out.println("-------------------------------------------->> ");  
    Parent p = new Parent( );	//슈퍼 클래스로 객체를 생성
    p.parentPrn( );            	//슈퍼 클래스(자기 자신)의 메서드 호출
  }                                           
}                                                                                      
