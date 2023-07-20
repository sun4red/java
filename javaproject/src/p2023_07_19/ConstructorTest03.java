package p2023_07_19;

class MyDate03{   
  private int year;    
  private int month;    
  private int day;
  public MyDate03(){ // 기본 생성자 
    year=2023;
    month=4;
    day=1;
  }  
  public void print(){
	System.out.println(year+ "/" +month+ "/" +day); 
  }
}// MyDate end

public class ConstructorTest03 {     
  public static void main(String[] args) {
    MyDate03 d=new MyDate03();
    // new 를 쓸때마다 heap메모리에 할당.
    d.print();
    
    
    
    // privaate 접근제어자는 외부 클래스의 접근을 허용하지 않기 때문에
    // 집접 접근할 수 ㅇ벗ㅂ다.
  }
}               