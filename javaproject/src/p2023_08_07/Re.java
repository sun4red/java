package p2023_08_07;

import java.io.File;

public class Re {

	public static void main(String[] args) {

		try {
			File tempFile = new File("test");

			File[] fl = tempFile.listFiles();

			for (int i = 0; i < fl.length; i++) {
				System.out.println("삭제 파일 : " + fl[i]);
				fl[i].delete();
			}
			tempFile.delete();
			System.out.println("폴더 확인 : " + tempFile.exists());
			System.out.println("삭제완료");

		} catch (Exception e) {
		}

	}

}
