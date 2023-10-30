package p2023_08_09;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

class JDBC_Select01 {
	public static void main(String[] args) {

		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";

		Connection con = null;
		PreparedStatement pstmt = null;
		
		// ---JDBC_Select 추가된 내용 -------
		ResultSet rs = null;
		ResultSet rs01 = null;
		int no = 0;
		String name, email, tel; // 데이터베이스에서 얻어온 필드값 저장할 변수 선언
		String sql; // SQL문을 저장할 변수 선언
		int cnt=0;	// 회원수 저장
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, "scott", "tiger");

			// count(*) : 총 데이터 갯수를 구해주는 함수
			String sql01="select count(*) from customer";
			pstmt = con.prepareStatement(sql01);
			// ? 가 없으니까 값 설정은 안해도 된다.
			
			rs01 = pstmt.executeQuery();
			
			// 가져올게 하나 뿐이라 if 문 사용?
			if(rs01.next()) {
				cnt = rs01.getInt(1);	// 메소드 오버로딩이 되있어 아래거나 이거나..
		//		cnt = rs01.getInt("count(*)");
			}
			System.out.println("총회원수:"+cnt);
			
			// ---JDBC_Select 추가된 내용 -------
			sql = "SELECT * FROM customer order by no desc"; // 정렬 가능
			System.out.printf("번호 \t 이름 \t\t 이메일 \t\t 전화번호 \n");
			System.out
					.printf("-----------------------------------------------------------------\n");
			pstmt = con.prepareStatement(sql);
			// sql문 실행 형식
			
			rs = pstmt.executeQuery(); // 얻어진 레코드를 가져옴
			// select 문 실행 !

			while (rs.next()) {
				no = rs.getInt("no");
				name = rs.getString("name");
				email = rs.getString("email");
				tel = rs.getString("tel");
				System.out.printf(" %d \t %s \t %s \t %s\n", no, name, email,
						tel);
			}
		} catch (Exception e) {
			System.out.println("데이터베이스 연결 실패!");
		} finally {
			try {// rs, stmt, con 객체를 close() 메서드를 호출해 해제
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
				// 안닫아주면 시스템 자원을 계속 쓰게됨
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
