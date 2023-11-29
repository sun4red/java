package p2023_08_03;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Re implements Runnable {

	public void run() {

		for (int i = 0; i < 60; i++) {
			Date d = new Date();
			SimpleDateFormat sd = new SimpleDateFormat("[YY년 MM월 dd일] hh시 mm분 ss초");
			System.out.println(sd.format(d));

			try {
				Thread.sleep(1000);
			} catch (Exception e) {
				System.out.println("종료");
			}
		}
	}

	public static void main(String[] args) {

		Re tic = new Re();
		Thread check = new Thread(tic);
		check.start();

	}

}
