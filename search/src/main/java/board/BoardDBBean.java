package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDBBean {

	// 싱글톤 : 객체 생성을 한번만 수행 하는 것

	private static BoardDBBean instance = new BoardDBBean();
	// 이렇게되면 외부에서 다이렉트 접근이 안된다.
	// 자기 자신을 return해주는 메소드를 생성 * 나중에 메소드 검색

	public static BoardDBBean getinstance() { // 정적 메소드
		return instance;
	}

	// 커넥션 풀에서 커넥션을 구해오는 메소드
	private Connection getConnect() throws Exception {

		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();

	}

	// 글작성

	public int insert(BoardDataBean board) { // DAO와 jsp들은 다른 패키지로 인식하기 때문에 반드시 public
		int result = 0;

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = getConnect();

			String sql = "insert into board " + "values(board_seq.nextval, ?, ?, ?, ?, sysdate, ?, ?, ?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getEmail());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getPasswd());
			pstmt.setInt(5, board.getReadcount());
			pstmt.setString(6, board.getContent());
			pstmt.setString(7, board.getIp());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	// 총 데이터 갯수 구하기

	public int getCount(String sel, String find) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = getConnect();
			
			if(sel != null && find != null) {	// 검색 데이터 갯수를 구한다.
				
				sql = "select count(*) from board "
						+ "where " + sel + " like '%" + find + "%'";
				
			}else {		// 전체 데이터 갯수를 구한다.
				
				sql = "select count(*) from board";
				
				
			}
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt("count(*)");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {

				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	// 게시판 목록 구하기 : 데이터 10개 추출
	public List<BoardDataBean> getlist(int start, int end, String sel, String find) {
		List<BoardDataBean> list = new ArrayList<BoardDataBean>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {

			con = getConnect();
			
			if(sel != null && find != null) {
				sql = "select * from (select rownum rnum, board.* from "
						+ "(select * from board "
						+ "order by num desc) board "
						+ "where " + sel + " like '%" + find + "%') "
						+ "where rnum >= ? and rnum <= ?";
				
			}else {
				sql = "select * from (select rownum rnum, board.* from "
						+ "(select * from board order by num desc) board)" + "where rnum >= ? and rnum <= ?";
				
			}
			

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery(); // select SQL문 실행

			while (rs.next()) { // 조건식을 만족하는 데이터를 1개씩 가져온다
				BoardDataBean board = new BoardDataBean();
				// jsp의 useBean과 같은 역할이며 중간 저장 역할 수행 힙메모리 저장
				// 프라이빗 변수기때문에 set 메소드로 컬럼별로 저장해줘야함

				board.setNum(rs.getInt("num"));
				board.setWriter(rs.getString("writer"));
				board.setEmail(rs.getString("email"));
				board.setSubject(rs.getString("subject"));
				board.setPasswd(rs.getString("passwd"));
				board.setReg_date(rs.getTimestamp("reg_date"));
				board.setReadcount(rs.getInt("readcount"));
				board.setContent(rs.getString("content"));
				board.setIp(rs.getString("ip"));

				list.add(board);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	// 상세 페이지 : 조회수 1 증가 + 상세정보 구하기

	public BoardDataBean updateContent(int num) {
		BoardDataBean board = new BoardDataBean();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = getConnect();
			String sql = "update board set readcount = readcount + 1 " + "where num = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate(); // update SQL문 실행

			sql = "select * from board where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) { // 조건식을 만족하는 데이터 1개를 가져온다.

				board.setNum(rs.getInt("num"));
				board.setWriter(rs.getString("writer"));
				board.setEmail(rs.getString("email"));
				board.setSubject(rs.getString("subject"));
				board.setPasswd(rs.getString("passwd"));
				board.setReg_date(rs.getTimestamp("reg_date"));
				board.setReadcount(rs.getInt("readcount"));
				board.setContent(rs.getString("content"));
				board.setIp(rs.getString("ip"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return board;
	}

	public BoardDataBean getContent(int num) {
		BoardDataBean board = new BoardDataBean();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = getConnect();

			String sql = "select * from board where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) { // 조건식을 만족하는 데이터 1개를 가져온다.

				board.setNum(rs.getInt("num"));
				board.setWriter(rs.getString("writer"));
				board.setEmail(rs.getString("email"));
				board.setSubject(rs.getString("subject"));
				board.setPasswd(rs.getString("passwd"));
				board.setReg_date(rs.getTimestamp("reg_date"));
				board.setReadcount(rs.getInt("readcount"));
				board.setContent(rs.getString("content"));
				board.setIp(rs.getString("ip"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return board;
	}

	// 글 수정

	public int update(BoardDataBean board) {
		int result = 0;

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = getConnect();

			String sql = "update board set writer = ?, email = ?, subject = ?, " + "content = ? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getEmail());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getContent());
			pstmt.setInt(5, board.getNum());

			result = pstmt.executeUpdate(); // update SQL문 실행

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	public int delete(int num) {
		int result = 0;

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = getConnect();
			String sql = "delete from board where num = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return result;
	}
}
