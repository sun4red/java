package p2023_08_16;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.GregorianCalendar;

public class Problem1 {

	public static void main(String[] args) {

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		GregorianCalendar yoon = new GregorianCalendar();

		System.out.println("연도를 입력하세요");

		try {

			int year = Integer.parseInt(br.readLine());

			if (yoon.isLeapYear(year)) {
				System.out.println(year + "년은 윤년입니다.");
			} else {
				System.out.println(year + "년은 평년입니다.");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
