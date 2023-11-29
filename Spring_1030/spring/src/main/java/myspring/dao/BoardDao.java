package myspring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mysql.cj.Session;

import myspring.model.Board;

@Repository
public class BoardDao {

	@Autowired
	private SqlSession session;

	public int insert(Board board) {
		// TODO Auto-generated method stub
		return session.insert("insert", board);
	}

	public int getCount() {
		// TODO Auto-generated method stub
		return session.selectOne("count");
	}

	public List<Board> getBoardList(int page) {
		// TODO Auto-generated method stub
		return session.selectList("list", page);
	}

	public void updatecount(int no) {
		session.update("hit", no);
	}

	public Board getBoard(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("content", no);
	}

	public int update(Board board) {
		// TODO Auto-generated method stub
		return session.update("update", board);
	}

	public int delete(int no) {

		return session.delete("delete", no);
	}

	
	// sql세션은 주입하고싶다고 바로 주입할 수 있는게 아니다
	
}
