package com.luck.mapper;

import java.util.List;

import com.luck.domain.BoardAttachDTO;

public interface BoardAttachMapper {
	//등록
	public void insert(BoardAttachDTO vo);
	//목록
	public List<BoardAttachDTO> findByBno(Long bno);
	//첨부파일목록 모두삭제
	public void deleteAll(Long bno);
	//어제날짜 첨부파일목록
	public List<BoardAttachDTO> getOldFiles();
}
