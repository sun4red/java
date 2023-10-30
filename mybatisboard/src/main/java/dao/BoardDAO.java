package dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
	public int insert(BoardBean board) throws Exception  {
		int result = 0;

		SqlSession session = null;

		try {

			session = getSession();
			result = session.insert("insert", board);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// 총 데이터 갯수 구하기
	public int getCount()  throws Exception {
		int result = 0;

		SqlSession session = getSession();
		result = ((Integer) session.selectOne("count")).intValue();

		return result;
	}

	// 글목록 : 데이터 10개 구하기
//	public List<BoardBean> getList(int page) throws Exception {
//		List<BoardBean> list = new ArrayList<BoardBean>();
	public List<BoardBean> getList(Map map) throws Exception {
		List<BoardBean> list = new ArrayList<BoardBean>();

		SqlSession session = getSession();

		list = session.selectList("list", map);

		return list;
	}

	// 조회수 1 등가
	public void readcountUpdate(int board_num) {

		SqlSession session = getSession();
		session.update("updatecount", board_num);

	}

	public BoardBean getDetail(int board_num) throws Exception {
		BoardBean board = new BoardBean();

		SqlSession session = getSession();

		board = (BoardBean) session.selectOne("content", board_num);

		return board;
	}

// 댓글 작성
	public int boardReply(BoardBean board) throws Exception  {
		int result = 0;

		SqlSession session = getSession();
		result = session.insert("replyinsert", board);

		return result;
	}

	// 글 수정
	public int update(BoardBean board) throws Exception  {
		int result = 0;

		SqlSession session = getSession();
		result = session.update("update", board);

		return result;
	}

	public int delete(int board_num) throws Exception  {
		int result = 0;

		SqlSession session = getSession();
		result = session.delete("delete", board_num);
		return result;
	}

	// 댓글 출력 순서 : board_re_seq값 증가
	public void updateSeq(BoardBean board) throws Exception  {
		// TODO Auto-generated method stub

		SqlSession session = getSession();
		session.update("updateseq", board);

	}

}
