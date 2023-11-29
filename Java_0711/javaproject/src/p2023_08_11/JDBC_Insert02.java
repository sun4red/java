package p2023_08_11;

import java.io.BufferedReader;  // 도스 콘솔 창에서 사용자 입력을 받아들이기 위해 BufferedReader 
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

class  JDBC_Insert02{
public static void main(String[] args) {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jsptest";	

  Connection con = null;
  PreparedStatement pstmt =  null;

 // ResultSet  rs   = null;
  String sql;

   String name, email, tel, no, address;
  
     try{
      Class.forName(driver);
      con = DriverManager.getConnection(url, "jspid", "jsppass" );         

      //---JDBC_Insert 추가된 내용-------
      // 테이블에 추가할 내용을 도스 콘솔 창에서 사용자의 입력을 받도록 한다.
      BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

      System.out.println(" customer 테이블에 값 입력하기 .....");
//      System.out.print(" 번호 입력: ");
//      no = br.readLine().trim();	  
      System.out.print(" 이름 입력: ");
      name = br.readLine().trim();            //테이블에 추가할 name 필드 값을 입력 받음
      System.out.print(" 이메일 입력: ");
      email = br.readLine().trim();             //테이블에 추가할 email 필드 값을 입력 받음
      System.out.print(" 전화번호 입력: ");
      tel = br.readLine().trim();               //테이블에 추가할 tel 필드 값을 입력 받음
      System.out.println("주소를 입력 하세요?");
      address = br.readLine().trim();
//	  int ino = Integer.parseInt(no);  		// 이제 시퀀스로 받을거기때문에 주석처리
      
	  Timestamp ts = new Timestamp(System.currentTimeMillis());
	  // 타임스탬프 객체 (날짜관련 클래스)
	  
      // INSERT 쿼리문을 작성
	  sql = "INSERT into customer ( name, email, tel, address, reg_date)";
	  sql+=		 " values ( ?, ?, ?,?, sysdate())"; // sysdate 함수지만 괄호 없고 대소문자 구분X, 오라클의 함수
	  			// " 내부에 공백이 없으면 오류가 날 수 있음.. 왜?"
	  
	  pstmt = con.prepareStatement( sql );
//	  pstmt.setInt(1, customer_no_seq.nextval); // 오류 발생
	  
	  pstmt.setString(1, name); // no 자리가 물음표가 없으니 물음표 자리 숫자를 맞춰줘야함.
	  pstmt.setString(2, email);
	  pstmt.setString(3, tel);
	  pstmt.setString(4, address);
//	  pstmt.setTimestamp(5, ts);	// 오라클에 어떤 자료로 저장되냐에 따라서 메소드가 지정됨
	  int result=pstmt.executeUpdate();   
	  	if(result == 1){
			 System.out.println(" Data insert success!! ");
	  	}else{
			System.out.println(" Data insert failed ");
		}
    } catch(Exception e){
      System.out.println("데이터베이스 연결 실패!");
    } finally{
		try{
//			if( rs != null )   rs.close();        
			if( pstmt != null ) pstmt.close();
			if( con != null )  con.close();
		 } catch(Exception e){ 
			System.out.println( e.getMessage());
		}
    }
  }
} 
