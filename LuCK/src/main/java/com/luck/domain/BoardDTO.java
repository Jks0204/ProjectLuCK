package com.luck.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardDTO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;
	private String category;
	private int replyCnt;
	private int viewCount;
	
	//첨부파일목록
	private List<BoardAttachDTO> attachList;
	
}
