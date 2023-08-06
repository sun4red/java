package p2023_07_20;

public class CalculatorEx {

	void powerOn() {
		System.out.println("전원을 켭니다.");
		
		// return; 생략 가능 (void)
	}

	int plus(int x, int y) {
		int result = x + y;
		return result;
		// return문 : plus()메소드를 호출한 곳에 값을 돌려주는 역할
		// return문은 메소드의 가장 마지막 줄에 사용해야한다.
	}

	double divide(int x, int y) {
		double result = (double) x / (double) y;
		return result;
	}

	void powerOff() {
		System.out.println("전원을 끕니다.");

	}

	public static void main(String[] args) {

		CalculatorEx myCalc = new CalculatorEx();
		myCalc.powerOn();
		
		int result1 = myCalc.plus(5, 6);
		System.out.println("result1:" + result1);
		
		byte x = 10;
		byte y = 4;
		double result2 = myCalc.divide(x, y);
		System.out.println("result2:"+ result2);
		myCalc.powerOff();
		
		
	}

}
