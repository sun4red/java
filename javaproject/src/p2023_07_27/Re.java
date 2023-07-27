package p2023_07_27;

import java.text.DecimalFormat;

class CC {
	static double c1(int r) {
		return (double) (2 * Math.PI * r);
	}

	static double c2(int r) {
		return (double) (Math.PI * r * r);
	}

	static double c3(int r) {
		return (double) (4 * Math.PI * r * r);
	}

	static double c4(int r) {
		return (double) (4 / 3 * Math.PI * r * r * r);
	}
}

public class Re {

	public static void main(String[] args) {
		DecimalFormat df = new DecimalFormat("0.00");
		int r = 5;

		System.out.println("원주\t:" + df.format(CC.c1(r)));
		System.out.println("원의 면적\t:" + df.format(CC.c2(r)));
		System.out.println("구의 표면적\t:" + df.format(CC.c3(r)));
		System.out.println("구의 체적\t:" + df.format(CC.c4(r)));

	}
}
