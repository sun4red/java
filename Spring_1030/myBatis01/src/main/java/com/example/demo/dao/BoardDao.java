package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Board;

@Repository
public class BoardDao {

	@Autowired
	private SqlSession session;
	
	public int insert(Board board) {
		
		return session.insert("insert", board);
	}
	public List<Board> list(){
	
		return session.selectList("list");
	}
}
