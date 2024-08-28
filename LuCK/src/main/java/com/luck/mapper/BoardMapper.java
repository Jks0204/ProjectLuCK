package com.luck.mapper;

import java.util.List;

import com.luck.domain.BoardDTO;

public interface BoardMapper {
	//목록
	public List<BoardDTO> getList();
	
	//등록 with select key
	public void insertSelectKey(BoardDTO board);
	
	public BoardDTO read();
	//정관수 시작
	public int update(BoardDTO dto);
	public int delete(Long bno);
	
	//정관수 끝
}
