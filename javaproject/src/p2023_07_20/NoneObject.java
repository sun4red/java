package p2023_07_20;

public class NoneObject {
    static int number = 3;
    // 정적 필드
    // 힙메모리가 아니라 공유 메모리에 저장..?
    // 메소드영역에 프로그램이 종료될때까지 저장
    // 메모리영역을 차지하기 때문에 특별한 경우가 아니면 static 을 잘 사용안함
    
    
    public static void printNumber() {	// 정적 메소드
        System.out.println("number = " + number);
    }
}            