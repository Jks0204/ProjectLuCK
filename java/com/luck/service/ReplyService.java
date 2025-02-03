package com.luck.service;

import com.luck.domain.Criteria;
import com.luck.domain.ReplyDTO;
import com.luck.domain.ReplyPageDTO;

public interface ReplyService {
	//등록
	public int register(ReplyDTO dto);
	//목록 with paging
	public ReplyPageDTO getListPage(Criteria cri,Long bno);
	//상세보기
	public ReplyDTO get(Long rno);
	//수정
	public int modify(ReplyDTO dto);
	//삭제
	public int remove(Long rno);
}
