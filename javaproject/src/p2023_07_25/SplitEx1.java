package p2023_07_25;

public class SplitEx1 {

	public static void main(String[] args) {

		String text = "홍길동&홍길순,김길동,김자바-안화수";
		// 서로다른 구분 기호로 되어있는걸 파싱하려고함

		String[] names = text.split("&|,|-");

		for (int i = 0; i < names.length; i++)
			System.out.print(names[i] + "\t");

		System.out.println();

		for (String name : names)
			System.out.print(name + "\t");
	}

}
