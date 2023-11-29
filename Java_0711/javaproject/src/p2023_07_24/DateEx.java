package p2023_07_24;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateEx {

	public static void main(String[] args) {
// 날짜 시간 관련 클래스 : Date, Timestamp
// 1. Date

		// 년, 월, 일, 시, 분, 초, 요일로 날짜를 출력
		SimpleDateFormat sd1 = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
		SimpleDateFormat sd2 = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss EEE요일");
		// DateFormat 클래스 상속

		Date d = new Date();
		System.out.println(d);
		// 이 클래스만을 가지고는 원하는 포맷으로 바꿀수는 없다.

		System.out.println(sd1.format(d));
		System.out.println(sd2.format(d));

// 2. Timestamp
		
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		// long형...
		
		System.out.println(ts);
		SimpleDateFormat sd3 = new SimpleDateFormat("yy년 MM월 dd일 HH:mm:ss");
		System.out.println(sd3.format(ts));
		
		
		
	}

}
