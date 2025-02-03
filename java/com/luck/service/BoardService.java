package com.luck.service;

import java.util.List;

import com.luck.domain.BoardAttachDTO;
import com.luck.domain.BoardDTO;
import com.luck.domain.Criteria;

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
	public int getCategoryCount(Criteria cri);
	public List<BoardDTO> getSideBar();
	//정관수 끝
	
	//민 시작 
	// 목록 with paging
	public List<BoardDTO> getList(Criteria cri);
	//시작 전체글수
	public int getTotal(Criteria cri);
	//민 끝
	
	//재혁
	//조회수 증가
	public int plus(Long bno);
}
