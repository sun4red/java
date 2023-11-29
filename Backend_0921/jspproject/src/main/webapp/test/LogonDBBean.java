// DAO(Data Access Object)

package register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class LogonDBBean {
	
	// 싱글톤 : 객체 생성을 한번만 수행 하는 것.
	private static LogonDBBean instance = new LogonDBBean();
	
	public static LogonDBBean getInstance() {	// 정적 메소드
		return instance;
	}

	// 회원가입 : 주소값 전달에 의한 메소드 호출방식(Call by Reference방식)
	public int insertMember(LogonDataBean member) {
		int result = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		

		
		try {
			// JDBC 방식
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			
			Class.forName(driver);
			con = DriverManager.getConnection(url,"scott","tiger");
			
			String sql="insert into member2 values(?,?,?,?,?,?,?,sysdate)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getJumin1());
			pstmt.setString(5, member.getJumin2());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getBlog());
			
			result = pstmt.executeUpdate();	// insert SQL문 실행
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// 전체 회원목록 구하기
	public List<LogonDataBean> selectMember(){
		List<LogonDataBean> list = new ArrayList<LogonDataBean>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,"scott" ,"tiger");
			
			String sql="select * from member2";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();	// select SQL문 실행
			
			while(rs.next()) {	// 데이터를 1개씩 가져온다.
				LogonDataBean member = new LogonDataBean();
//				member.id = "test";   // 접근안됨(private 접근 제어자)
	
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setJumin1(rs.getString("jumin1"));
				member.setJumin2(rs.getString("jumin2"));
				member.setEmail(rs.getString("email"));
				member.setBlog(rs.getString("blog"));
				member.setReg_date(rs.getDate("reg_date"));
				
				list.add(member);
			}			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// 회원 수정폼 : 회원 1명 정보 구하기
	public LogonDataBean updateForm(String id) {
		LogonDataBean member = new LogonDataBean();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,"scott","tiger");
			
			String sql="select * from member2 where id=?";
			
			if(rs.next()) {
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setJumin1(rs.getString("jumin1"));
				member.setJumin2(rs.getString("jumin2"));
				member.setEmail(rs.getString("email"));
				member.setBlog(rs.getString("blog"));
				member.setReg_date(rs.getDate("reg_date"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		
		return member;
	}
	
	
	
	
	
	
}
