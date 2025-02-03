package com.luck.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luck.domain.Criteria;
import com.luck.domain.ReplyDTO;
import com.luck.domain.ReplyPageDTO;
import com.luck.mapper.BoardMapper;
import com.luck.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService{
	
	private ReplyMapper mapper; //자동주입. 생성자의존성주입
	
	private BoardMapper boardMapper; //자동주입. 생성자의존성주입
	
	@Transactional // Transaction처리
	@Override
	public int register(ReplyDTO dto) {
		//댓글갯수 1증가
		boardMapper.updateReplyCnt(dto.getBno(), 1);
		
		return mapper.insert(dto);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		
		return new ReplyPageDTO(mapper.getCountByBno(bno), mapper.getListWithPaging(cri,bno));
	}

	@Override
	public ReplyDTO get(Long rno) {
		
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyDTO dto) {
		
		return mapper.update(dto);
	}

	@Transactional
	@Override
	public int remove(Long rno) {
		
		ReplyDTO dto=mapper.read(rno); // 부모글번호 bno가 필요해서 실행
		
		//댓글갯수를 1감소
		boardMapper.updateReplyCnt(dto.getBno(), -1);
		
		return mapper.delete(rno);
	}
	
	
}
