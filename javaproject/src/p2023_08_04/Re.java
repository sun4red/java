package p2023_08_04;

import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.InputStreamReader;

public class Re {

	public static void main(String[] args) {

		System.out.println("저장할 내용을 입력하세요");


		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		try {
			FileWriter fw = new FileWriter("result.txt");
			fw.write(br.readLine());
			fw.close();

		} catch (Exception e) {
			System.out.println("예외");
		}

	}

}
