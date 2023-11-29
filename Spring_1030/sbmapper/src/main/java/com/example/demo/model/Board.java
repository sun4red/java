package com.example.demo.model;

import java.util.Date;
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("board") // 환경설정에 패키지에 대해 알리아스 설정이되어있어야한다.
public class Board {
	private int no;
	private String writer;
	private String passwd;
	private String subject;
	private String content;
	private int readcount;
	private Date register;
	
}
