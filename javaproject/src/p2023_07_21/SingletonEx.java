package p2023_07_21;


class Singleton{
	// 싱글톤 : 객체 생성을 1번만 수행하는 것.
	
	
	private static Singleton s = new Singleton(); // 정적 필드
	
	
	private Singleton () {}; // 직접 객체 생성을 막아주는 역할
	
	
	// 정적메소드를 이용해서 공유를 한다.
	public static Singleton getInstance () { // 정적 메소드
		
		return s;
	}
	
	
	public void check() {
		System.out.println("메소드 호출 성공1");
	}
	public void check1() {
		System.out.println("메소드 호출 성공2");
	
	}
	
}



public class SingletonEx {
	
	public static void main(String[] args) {
//		System.out.println(Singleton.s); // 오류발생
		
		Singleton obj1= Singleton.getInstance();
		Singleton obj2= Singleton.getInstance();
		// 정적변수를 통해 공유를 했기 때문에 같은 주소값 리턴
		// new를 사용하지 않아 별도의 heap메모리에 할당받지않음
		// 메모리를 조금 먹어서 서버 부하 예방하는건가?
		// DB연동이 들어가게되면 DAO에서 싱글톤을 주로 사용한다.
		
		System.out.println(obj1);
		System.out.println(obj2);
		
		if(obj1==obj2) {
			System.out.println("같은주소");
			
		}else {
			System.out.println("다른주소");
			
		}
//		Singleton s = new Singleton(); // 오류발생
		// 기본 생성자를 만들어놨기 때문에 또 만들수가 없다!
		// 이미 생성자가 있기 때문에 호출해야하는데 private 이라 막혀있음!
		
		
		obj1.check();
		obj1.check1();
		obj2.check();
		obj2.check1();
	}
	
}
