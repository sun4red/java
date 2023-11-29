package p2023_08_29;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;

class CallableStatementTest {

	public static void main(String[] args) {
		Connection con = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = null;
		CallableStatement cs = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, "scott", "tiger");

			sql = "{call del_all()}";

			// CallableStatement를 객체를 생성
			cs = con.prepareCall(sql);
			cs.execute();
			
			System.out.println("프로시저실행완료");
			
			cs.close();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
