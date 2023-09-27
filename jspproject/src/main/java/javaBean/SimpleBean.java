// 자바빈 클래스
// DTO(Data Transfer Object)


package javaBean;

public class SimpleBean {

	private String name;
	private String msg;		// Java에서는 필드라고는 하지만 Property라고 부르기로함


	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	

	
	
	
}
