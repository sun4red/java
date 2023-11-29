package com.example.demo.model;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("board")
public class Board {

	private int no;
	private String name;
	private String subject;
	private String content;
	private Date register;
	
	
}
