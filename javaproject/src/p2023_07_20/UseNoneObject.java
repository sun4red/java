package p2023_07_20;

public class UseNoneObject {

    public static void main( String[] args ) {
    
    NoneObject no = new NoneObject();
    System.out.println("no.number = " + no.number);
    no.printNumber();
    
    System.out.println("NoneObject.number = " + 
									NoneObject.number);
    NoneObject.printNumber();
    // 정적메소드를 호출해서 실행함 : 클래스.정적메소드명()
    
    
    }
}    