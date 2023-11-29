package myspring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mysql.cj.Session;

import myspring.model.Board;

@Mapper
public interface BoardDao{


	public int insert(Board board);

	public int getCount();

	public List<Board> getBoardList(int page);

	public void updatecount(int no);

	public Board getBoard(int no);

	public int update(Board board);

	public int delete(int no);

	
	// sql세션은 주입하고싶다고 바로 주입할 수 있는게 아니다
	
}
