package p2023_07_13;

public class Test {
	public static void main(String[] args) {
/*
		int c = 30;
		c = (char) c;
		System.out.println(c);
		float f = 3.114f;
		f = (int) f;
		System.out.println(f);
		
		char a = 65;
		System.out.println(a);
	*/
		
		int a = 10 , b = 20 , c = 30 ;
		
		if(a<b && b<c) {
			System.out.println("a<b<c");
		} else
			System.out.println("아님");
		
		
		if(a<b || b<c) {
			System.out.println("?");
		} else
			System.out.println("!");
			
		
		
	}
}
