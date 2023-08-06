package p2023_07_24;

public class ReplaceEx {

	// replace(oldChar, newChar)
	// oldChar를 newChar로 치환해주는 역할

	public static void main(String[] args) {

		String oldStr = "자바는 객체 지향 언어입니다. 자바는 풍부한 API를 지원합니다.";
		String newStr = oldStr.replace("자바", "JAVA");
		System.out.println(oldStr);
		System.out.println(newStr);

	}

}
