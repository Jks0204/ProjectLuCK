package com.luck.service;

import java.util.List;

import com.luck.domain.BoardAttachDTO;
import com.luck.domain.BoardDTO;

public interface BoardService {
	//목록
	public List<BoardDTO> getList();
	//등록
	public void register(BoardDTO board);
	//상세보기
	public BoardDTO get(Long bno);
	
	//정관수 시작
	public boolean update(BoardDTO dto);
	public boolean delete(Long bno);
	public void deleteFiles(List<BoardAttachDTO> attachList);
	public List<BoardAttachDTO> getAttachList(Long bno);
	//정관수 끝
}
