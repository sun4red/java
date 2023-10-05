// DAO(Data Access Object)

package member;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

	// 싱글톤 : 객체 생성을 한번만 수행 하는 것.
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	// 컨넥션풀에서 컨넥션을 구해오는 메소드
	private Connection getConnection() throws Exception{
		Context init = new InitialContext();
  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
  		return ds.getConnection();
	}
	
	
	// 회원가입
	public int insert(MemberDTO member) {
		int result = 0;

		Connection con = null;
		PreparedStatement pstmt = null;
		
		try { 
			// 컨넥션풀에서 컨넥션을 구해온다.
			con = getConnection();
			
String sql="insert into member ";
       sql+=" values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";			
			
       		pstmt = con.prepareStatement(sql);
       		pstmt.setString(1, member.getId());
       		pstmt.setString(2, member.getPasswd());
       		pstmt.setString(3, member.getName());
       		pstmt.setString(4, member.getJumin1());
       		pstmt.setString(5, member.getJumin2());
       		pstmt.setString(6, member.getMailid());
       		pstmt.setString(7, member.getDomain());
       		pstmt.setString(8, member.getTel1());
       		pstmt.setString(9, member.getTel2());
       		pstmt.setString(10, member.getTel3());
       		pstmt.setString(11, member.getPhone1());
       		pstmt.setString(12, member.getPhone2());
       		pstmt.setString(13, member.getPhone3());
       		pstmt.setString(14, member.getPost());
       		pstmt.setString(15, member.getAddress());
       		pstmt.setString(16, member.getGender());
       		pstmt.setString(17, member.getHobby());
       		pstmt.setString(18, member.getIntro());
       		
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
	
	
}


