package p2023_07_31;

 class Parent03{
  public void parentPrn( ){			// 부모 클래스
     System.out.println("슈퍼 클래스 : ParentPrn 메서드");  
  }
}
class Child03 extends Parent03{ 		// 자식 클래스
  public void childPrn( ){
     System.out.println("서브 클래스 : ChildPrn 메서드");  
 }                                             
}
 class RefTest03{		// ?
  public static void main(String[] args){
  
	  Parent03  p = new  Child03( );  //서브 클래스로 인스턴스 선언
  
  // 안전한 방법이 아니라서 업캐스팅을 한번수행..?
	  
	  
  p.parentPrn(); // 부모가 상속해준 메소드만 호출 가능함
//  p.childPrn(); // 부모가 상속해주지 않는 메소드는 호출할 수 없다.
  
  
  
  
 //p.childPrn();//-컴파일 에러
  Child03  c;                   //서브 클래스로 레퍼런스 변수 선언
  
  
  System.out.println("---------------->>");
  
  //서브 클래스 레퍼런스 변수에 슈퍼 클래스의 레퍼런스 값이 대입됨
  c = (Child03) p;   //강제 형변환으로 다운 캐스팅
  
  
  Child03 c1 = (Child03)p;   // 두줄로 된걸 한줄로...
  
  // 슈퍼클래스에서 서브클래스로 형변환
  // 참조가능한 영역이 확대가 된다.
  // 컴파일러에 의해서 자동 형변환이 되지않기 때문에 자료형 생략할 수 없음.(강제변환)
  
  
  c.parentPrn();               
  c.childPrn();
 }  
}