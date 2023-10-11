package reboard;

import java.sql.Connection;

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

		return result;
	}

}
