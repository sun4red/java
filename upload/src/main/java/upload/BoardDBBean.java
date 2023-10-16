package upload;

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

	private Connection getConnection() throws Exception {

		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();

	}

// 글작성
	public int insert(BoardDataBean board) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = getConnection();
			
			String sql = "insert into upload values("
					+ "upload_seq.nextval, ?, ?, ?, ?, sysdate, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getEmail());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getPasswd());
			
			pstmt.setInt(5, board.getReadcount());	// 0
			pstmt.setString(6, board.getContent());
			pstmt.setString(7, board.getIp());
			pstmt.setString(8, board.getUpload());
			
			result = pstmt.executeUpdate();		// insert SQL문 실행
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		return result;
	}

	
	public int getCount() {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = getConnection();
			String sql = "select count(*) from upload";

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();		// select SQL문 실행
			
			if(rs.next()) {
//				result = rs.getInt(1);				
				result = rs.getInt("count(*)");				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
				if(rs!=null)rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return result;
	}
	
	// 게시물 목록 : 데이터 10개 추출
	public List<BoardDataBean> getList(int start, int end){
		List<BoardDataBean> list = new ArrayList();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			
			con = getConnection();
			
			String sql = "select * from "
					+ "(select rownum rnum, upload.* from "
					+ "(select * from upload order by num desc) upload) "
					+ "where rnum >= ? and rnum <= ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDataBean board = new BoardDataBean();
				board.setNum(rs.getInt("num"));
				board.setWriter(rs.getString("writer"));
				board.setEmail(rs.getString("email"));
				board.setSubject(rs.getString("subject"));
				board.setPasswd(rs.getString("passwd"));
				board.setReg_date(rs.getTimestamp("reg_date"));
				board.setReadcount(rs.getInt("readcount"));
				board.setContent(rs.getString("content"));
				board.setIp(rs.getString("ip"));
				board.setUpload(rs.getString("upload"));
				
				list.add(board);
				
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
				if(rs!=null)rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return list;
	}
	
	// 상세 페이지 : 조회수 1 증가 + 상세 정보 구하기

	public BoardDataBean updateContent(int num) {
		BoardDataBean board = new BoardDataBean();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = getConnection();
			
			String sql = "update upload set readcount = readcount + 1 "
					+ "where num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();		// update SQL문 실행
			
			sql = "select * from upload where num = ?";
			
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
				board.setContent(rs.getString("content"));
				board.setIp(rs.getString("ip"));
				board.setUpload(rs.getString("upload"));
			}
			
			
			
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
				if(rs!=null)rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return board;
	}
	
	
	// 수정폼 : 상세정보 구하기
	public BoardDataBean getContent(int num) {
		BoardDataBean board = new BoardDataBean();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = getConnection();
			
			String sql = "select * from upload where num = ?";
			
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
				board.setContent(rs.getString("content"));
				board.setIp(rs.getString("ip"));
				board.setUpload(rs.getString("upload"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
				if(rs!=null)rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		return board;
	}
	
	public int update(BoardDataBean board) {
		int result = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = getConnection();
			String sql = "update upload set writer = ?, email = ?, subject = ?, "
					+ "content = ?, ip = ?, upload = ? where num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getEmail());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getContent());
			pstmt.setString(5, board.getIp());
			pstmt.setString(6, board.getUpload());
			
			pstmt.setInt(7, board.getNum());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null)pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		return result;
	}
}
