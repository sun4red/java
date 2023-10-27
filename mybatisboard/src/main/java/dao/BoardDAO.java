package dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.BoardBean;

public class BoardDAO {

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}
	private SqlSession getSession() {
		SqlSession session = null;
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader("mybatis-config.xml");
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(reader);
			session = sf.openSession(true); // auto commit
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		return session;
	}

	
// 글작성 : 원문작성
	public int insert(BoardBean board) {
		int result = 0;

		SqlSession session = null;
		
		try {
			
			session = getSession();
			result = session.insert("insert", board);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}

	
	
	
//	// 총 데이터 갯수 구하기
//	public int getCount() {
//		int result = 0;
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//		
//			con = getConnection();
//			String sql = "select count(*) from model2board";
//			pstmt = con.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				result = rs.getInt("count(*)");
//			}
//			
//			
//		}catch(Exception e){
//			e.printStackTrace();
//		}finally {
//			try {
//				if(con!=null)con.close();
//				if(pstmt!=null)pstmt.close();
//				if(rs!=null)rs.close();
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
//		}
//		
//		
//		return result;
//	}
//
//	// 글목록 : 데이터 10개 구하기
//	public List<BoardBean> getList(int startRow, int endRow) {
//		List<BoardBean> list = new ArrayList<BoardBean>();
//		
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			
//			con = getConnection();
//			
//			String sql = "select * from (select rownum rnum, board.* from "
//					+ "(select * from model2board order by board_re_ref desc, board_re_seq asc) board) "
//					+ "where rnum >= ? and rnum <= ?";
//			
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, startRow);
//			pstmt.setInt(2, endRow);
//			rs = pstmt.executeQuery();		// select SQL문 실행
//			
//			while(rs.next()) {
//				BoardBean board = new BoardBean();
//				board.setBoard_num(rs.getInt("board_num"));
//				board.setBoard_name(rs.getString("board_name"));
//				board.setBoard_pass(rs.getString("board_pass"));
//				board.setBoard_subject(rs.getString("board_subject"));
//				board.setBoard_content(rs.getString("board_content"));
//				board.setBoard_file(rs.getString("board_file"));
//				board.setBoard_re_ref(rs.getInt("board_re_ref"));
//				board.setBoard_re_lev(rs.getInt("board_re_lev"));
//				board.setBoard_re_seq(rs.getInt("board_re_seq"));
//				board.setBoard_readcount(rs.getInt("board_readcount"));
//				board.setBoard_date(rs.getTimestamp("board_date"));
//				
//				list.add(board);
//				
//			}
//					
//			
//			
//			
//			
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally {
//			try {
//				if(con!=null)con.close();
//				if(pstmt!=null)pstmt.close();
//				if(rs!=null)rs.close();
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
//		}
//		
//		
//		
//		
//		
//		return list;
//	}
//	// 조회수 1 등가
//	public void readcountUpdate(int board_num) {
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		
//		try {
//			con = getConnection();
//			String sql = "update model2board set board_readcount = board_readcount+1 "
//					+ "where board_num = ?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, board_num);
//			pstmt.executeUpdate();
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally {
//			try {
//				if(con!=null)con.close();
//				if(pstmt!=null)pstmt.close();
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
//		}
//		
//		
//	}
//
//	public BoardBean getDetail(int board_num) {
//		BoardBean board = new BoardBean();
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			
//			con = getConnection();
//			String sql = "select * from model2board where board_num = ?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, board_num);
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				board.setBoard_num(rs.getInt("board_num"));
//				board.setBoard_name(rs.getString("board_name"));
//				board.setBoard_pass(rs.getString("board_pass"));
//				board.setBoard_subject(rs.getString("board_subject"));
//				board.setBoard_content(rs.getString("board_content"));
//				board.setBoard_file(rs.getString("board_file"));
//				board.setBoard_re_ref(rs.getInt("board_re_ref"));
//				board.setBoard_re_lev(rs.getInt("board_re_lev"));
//				board.setBoard_re_seq(rs.getInt("board_re_seq"));
//				board.setBoard_readcount(rs.getInt("board_readcount"));
//				board.setBoard_date(rs.getTimestamp("board_date"));
//			}
//			
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally {
//			try {
//				if(con!=null)con.close();
//				if(pstmt!=null)pstmt.close();
//				if(rs!=null)rs.close();
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
//		}
//		
//		return board;
//	}
//// 댓글 작성
//	public int boardReply(BoardBean board) {
//		int result = 0;
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		
//		// 부모글에 대한 정보
//		int re_ref = board.getBoard_re_ref();	// 글 그룹 번호
//		int re_lev = board.getBoard_re_lev();	// 댓글 깊이
//		int re_seq = board.getBoard_re_seq();	// 댓글의 출력 순서
//		
//		try {
//			
//			con = getConnection();
//			String sql = "update model2board set board_re_seq = board_re_seq+1 "
//					+ "where board_re_ref = ? and board_re_seq > ?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, re_ref);
//			pstmt.setInt(2, re_seq);
//			
//			pstmt.executeUpdate();
//			
//			sql = "insert into model2board values(model2board_seq.nextval, "
//					+ "?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
//			
//			pstmt = con.prepareStatement(sql);
//			
//			pstmt.setString(1, board.getBoard_name());
//			pstmt.setString(2, board.getBoard_pass());
//			pstmt.setString(3, board.getBoard_subject());
//			pstmt.setString(4, board.getBoard_content());
//			pstmt.setString(5, "");
//			pstmt.setInt(6, re_ref);
//			pstmt.setInt(7, re_lev+1);
//			pstmt.setInt(8, re_seq+1);
//			pstmt.setInt(9, 0);
//			result = pstmt.executeUpdate();
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally {
//			try {
//				if(con!=null)con.close();
//				if(pstmt!=null)pstmt.close();
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
//		}
//		
//		
//		return result;
//	}
//	// 글 수정
//	public int update(BoardBean board) {
//		int result = 0;
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		
//		try {
//			
//			con = getConnection();
//			String sql = "update model2board set board_name = ?, board_subject = ?, "
//					+ "board_content = ? where board_num = ?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, board.getBoard_name());
//			pstmt.setString(2, board.getBoard_subject());
//			pstmt.setString(3, board.getBoard_content());
//			pstmt.setInt(4, board.getBoard_num());
//			
//			result = pstmt.executeUpdate();
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally {
//			try {
//				if(con!=null)con.close();
//				if(pstmt!=null)pstmt.close();
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
//		}
//		
//		return result;
//	}
//
//	public int delete(int board_num) {
//		int result = 0;
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		
//		try {
//			
//			con = getConnection();
//			String sql = "delete from model2board where board_num = ?";
//			pstmt = con.prepareStatement(sql); 
//			pstmt.setInt(1, board_num);
//			
//			result = pstmt.executeUpdate();
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//		return result;
//	}

}
