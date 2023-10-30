package test;

public class T090803 {

	public static void main(String[] args) {
		int p = 1;

		for (int i = 0; i < 5; i++, p *= i)
			;
		double pAsDouble = (double) p;
		System.out.printf("%.3f", pAsDouble);
	}

}
