//DAO(Data Access Object)

package register;

public class LogonDBBean {

	// 싱글톤 : 객체 생성을 한번만 수행 하는 것
	
	private static LogonDBBean instance = new LogonDBBean(); 
	
	public static LogonDBBean getInstance() { // 정적 메소드
		return instance;
	}
	
	// 회원가입 : 주소값 전달에 의한 메소드 호출방식(Call by Reference 방식)
	
	public int insertMemeber() {
		int result = 0;
		
		return result;
	}
	
}
