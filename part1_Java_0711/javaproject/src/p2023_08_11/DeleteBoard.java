package p2023_08_11;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DeleteBoard {

	public static void main(String[] args) {

		Connection con = null;
		PreparedStatement pstmt = null;

		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jsptest";	

		try {
			Class.forName(driver);
		      con = DriverManager.getConnection(url, "jspid", "jsppass" ); 

			BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
			System.out.println("글 번호를 입력하세요");

			int no = Integer.parseInt(br.readLine());

			String sql = "delete from board where no = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, no);

			int result = pstmt.executeUpdate(); // delete SQL문 실행

			if (result == 1) {
				System.out.println("글 삭제 완료");
			} else {
				System.out.println("글 삭제 실패");
			}

		} catch (Exception e) {
			System.out.println("숫자만 입력하세요/");
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					if (con != null) {
						con.close();
					}
				}
			} catch (Exception e) {

			}

		}

	}

}
