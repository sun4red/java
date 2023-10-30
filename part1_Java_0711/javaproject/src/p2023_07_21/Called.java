package p2023_07_21;


// private 붙이면 외부 클래스 접근 차단하기 때문에 Calling(외부 클래스)에서 에러가 발생
public class Called {

	// private 를 메소드 앞에 붙이면 메소드를 호출하는 단계에서 에러가 발생한다!
	// 클래스는 접근이 가능?
	public void check(){
		System.out.println("메소드 호출 성공");
	}
	
}


// 같은 패키지 안에 들어있는 클래스에 접근 하기 위해서는 접근 제어자가
// public이나 default 접근 제어자로 되어 있어야 한다.
// 같은 패키지 안에 들어 있는 클래스에 접근 하기 위해서는
// 해당 클래스를 import해야한다.