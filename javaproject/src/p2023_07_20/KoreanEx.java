package p2023_07_20;

class Korean {
	String nation = "대한민국";
	String name;
	String ssn;

	public Korean(String name, String ssn) {
		this.name = name;
		this.ssn = ssn;
	}
}

public class KoreanEx {

	public static void main(String[] args) {

		Korean k1 = new Korean("박자바", "011225-1234567");
		System.out.println("k1.name:" + k1.name);
		System.out.println("k1.ssn:" + k1.ssn);

		Korean k2 = new Korean("김자바", "930050-1234567");
		System.out.println("k2.name:" + k2.name);
		System.out.println("k2.ssn:" + k2.ssn);
		
		
	}
}
