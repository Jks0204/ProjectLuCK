package com.luck.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.luck.domain.BoardAttachDTO;
import com.luck.domain.BoardDTO;
import com.luck.domain.Criteria;

public interface BoardMapper {
	//목록
	public List<BoardDTO> getList();
	
	//등록 with select key
	public void insertSelectKey(BoardDTO board);
	
	public BoardDTO read(Long bno);
	//정관수 시작
	public List<BoardDTO> getListWithCategory(Criteria cri);
	public int getCategoryCount(Criteria cri);
	
	public int update(BoardDTO dto);
	public int delete(Long bno);
	
	public List<BoardDTO> getSideBar();
	//정관수 끝
	
	//민 전체글수
	public int getTotalCount(Criteria cri);
	//목록 with paging
	public List<BoardDTO> getListWithPaging(Criteria cri);
	//민 끝
	
	//재혁시작
	//댓글갯수업데이트. parameter가 2개이상인 경우 @Param사용
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	//목록
	public List<BoardAttachDTO> findByBno(Long bno);
	//조회수증가
	public int updateViewCount(Long bno);
	//재혁 끝
}
