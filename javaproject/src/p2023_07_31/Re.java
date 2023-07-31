package p2023_07_31;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Scanner;

public class Re {

	public static void main(String[] args) {

		System.out.println("연도를 입력하세요");
		Scanner sc = new Scanner(System.in);
		int year = sc.nextInt();
		
		
		GregorianCalendar yoon = new GregorianCalendar();
		
		if (yoon.isLeapYear(year)) {
			System.out.println("윤년");
		} else {
			System.out.println("평년");
		}

	}

}
