package reboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDBBean {
	private static BoardDBBean instance = new BoardDBBean();

	public static BoardDBBean getInstance() {
		return instance;
	}

// 커넥션 풀에서 커넥션을 구해오는 메소드

	private Connection getConnection() throws Exception {

		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();

	}

	// 원문 글 작성

	public int insert(BoardDataBean board) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			
			String sql = "insert into reboard values(reboard_seq.nextval, "
					+ "?, ?, ?, ?, sysdate, ?, reboard_seq.nextval, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getEmail());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getPasswd());
			
			pstmt.setInt(5, 0);	//board.getReadcount()
			
			pstmt.setInt(6, 0);	//board.getRe_step()
			pstmt.setInt(7, 0); //board.getRe_level()
			pstmt.setString(8, board.getContent());
			pstmt.setString(9, board.getIp());
			
			result = pstmt.executeUpdate();	// insert SQL문 실행
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}

		return result;
	}

	// 총 데이터 갯수 구하기
	public int getCount() {
		int result = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = getConnection();
			
			String sql = "select count(*) from reboard";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("count(*)");
				
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
		
		return result;
	}
	
	
	public List<BoardDataBean> getList(int start, int end) {
	List<BoardDataBean> list = new ArrayList<BoardDataBean>();
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		
		con = getConnection();
		
		String sql = "select * from (select rownum rnum, board.* from "
				+ "(select * from reboard order by ref desc, re_step asc) board) "
				+ "where rnum >= ? and rnum <= ?";
		// 위의 board와 별칭은 같게, 정렬을 두번 하는 것 매우 중요 - 원문은 내림차순, 댓글은 오름차순
		// re_step 이게 제일 어렵다고 함
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,  start);
		pstmt.setInt(2,  end);
		
		rs = pstmt.executeQuery();	// select SQL문 실행
		
		while(rs.next()) {
			BoardDataBean board = new BoardDataBean();
			board.setNum(rs.getInt("num"));
			board.setWriter(rs.getString("writer"));
			board.setEmail(rs.getString("email"));
			board.setSubject(rs.getString("subject"));
			board.setPasswd(rs.getString("passwd"));
			board.setReg_date(rs.getTimestamp("reg_date"));
			board.setReadcount(rs.getInt("readcount"));
			board.setRef(rs.getInt("ref"));
			board.setRe_level(rs.getInt("re_level"));
			board.setRe_step(rs.getInt("re_step"));
			board.setContent(rs.getString("content"));
			board.setIp(rs.getString("ip"));
			
			list.add(board);
			
		}
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		}catch(Exception e) {
			e.printStackTrace();;
		}
	}
		
		
		
	return list;	
	}
	
	
	// 상세 페이지 : 조회수 1증가 + 상세정보 구하기
	public BoardDataBean updateContent(int num) {
		BoardDataBean board = new BoardDataBean();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";
		
		try {
			
			con = getConnection();
			
			sql = "update reboard set readcount = readcount + 1 "
					+ "where num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();		// update SQL문 실행
			
			sql = "select * from reboard where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				board.setNum(rs.getInt("num"));
				board.setWriter(rs.getString("writer"));
				board.setEmail(rs.getString("email"));
				board.setSubject(rs.getString("subject"));
				board.setPasswd(rs.getString("passwd"));
				board.setReg_date(rs.getTimestamp("reg_date"));
				board.setReadcount(rs.getInt("readcount"));
				board.setRef(rs.getInt("ref"));
				board.setRe_level(rs.getInt("re_level"));
				board.setRe_step(rs.getInt("re_step"));
				board.setContent(rs.getString("content"));
				board.setIp(rs.getString("ip"));
				
			}
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();;
			}
		}
		
		
		
		return board;
	}
	
	public int reply(BoardDataBean board) {
		int result = 0;
		
		// 부모글에 대한 정보
		
		int ref = board.getRef();
		int re_step = board.getRe_step();
		int re_level = board.getRe_level();

		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			
		// 1. 원문이 부모인 경우
		// 	원문의 re_step = 0 이기 때문에, 모든 댓글들의 re_step값이 1씩 증가된다.
		// 2. 댓글이 부모인 경우
		//	부모의 re_step값 보다 큰 댓글만 값이 1씩 증가된다.
		
			
			
			String sql = "update reboard set re_step = re_step + 1 "
					+ "where ref = ? and re_step > ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);			// 부모의 ref
			pstmt.setInt(2, re_step);		// 부모의 ref_step
			
			pstmt.executeUpdate();		// update SQL문 실행
			
			sql = "insert into reboard values(reboard_seq.nextval, "
					+ "?, ?, ?, ?, sysdate, ?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  board.getWriter());
			pstmt.setString(2,  board.getEmail());
			pstmt.setString(3,  board.getSubject());
			pstmt.setString(4,  board.getPasswd());
			
			pstmt.setInt(5, 0);	// board.getReadcount()
			pstmt.setInt(6,  ref);
			pstmt.setInt(7,  re_step + 1);
			pstmt.setInt(8,  re_level + 1);

			pstmt.setString(9,  board.getContent());
			pstmt.setString(10,  board.getIp());
			
			result = pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();;
			}
		}
		
		return result;
	}
	
	
	public BoardDataBean getContent(int num) {
		
		BoardDataBean board = new BoardDataBean();
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";
		
		try {
			
			con = getConnection();
			
			sql = "select * from reboard where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				board.setNum(rs.getInt("num"));
				board.setWriter(rs.getString("writer"));
				board.setEmail(rs.getString("email"));
				board.setSubject(rs.getString("subject"));
				board.setPasswd(rs.getString("passwd"));
				board.setReg_date(rs.getTimestamp("reg_date"));
				board.setReadcount(rs.getInt("readcount"));
				board.setRef(rs.getInt("ref"));
				board.setRe_level(rs.getInt("re_level"));
				board.setRe_step(rs.getInt("re_step"));
				board.setContent(rs.getString("content"));
				board.setIp(rs.getString("ip"));
				
			}
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();;
			}
		}

		return board;
	}
	
	// 글수정
	
	public int update(BoardDataBean board) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			
			String sql = "update reboard set writer = ?, email = ?, subject = ?, "
					+ "content = ? where num = ?";
				
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  board.getWriter());
			pstmt.setString(2,  board.getEmail());
			pstmt.setString(3,  board.getSubject());
			pstmt.setString(4,  board.getContent());
			pstmt.setInt(5,  board.getNum());
			result = pstmt.executeUpdate();		// update SQL문 실행
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		return result;
	}
	
	// 글 삭제
	
	public int delete(BoardDataBean board) {
	int result = 0;
	
	Connection con = null;
	PreparedStatement pstmt = null;
	
	String sql = "";
	
	try {
		
		con = getConnection();
		
		if(board.getRe_level() == 0) {	// 원문
			
			sql = "update reboard set subject = ?, content = ? where num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  "관리자에 의해서 삭제됨");
			pstmt.setString(2,  " ");
			pstmt.setInt(3,  board.getNum());
			
			
		}else {		// 댓글
			
			sql = "delete from reboard where num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board.getNum());
			
			
		}
		
		result = pstmt.executeUpdate();	// update 또는 delete SQL문 실행
		
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		
	}
	
	
	return result;
	}
}
