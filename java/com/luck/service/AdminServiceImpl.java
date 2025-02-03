package com.luck.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luck.domain.BoardDTO;
import com.luck.domain.Criteria;
import com.luck.domain.MemberVO;
import com.luck.domain.ReplyDTO;
import com.luck.mapper.AdminMapper;
import com.luck.mapper.BoardAttachMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService {

	private AdminMapper mapper;
    private BoardAttachMapper attach;
	
	public List<BoardDTO> getBoard(Criteria cri) {
		List<BoardDTO> list = new ArrayList<>();
		list=mapper.getBoard(cri);
		list.forEach(board -> {
	        board.setAttachList(attach.findByBno(board.getBno()));
	    });
	    return list;
	}

	public List<ReplyDTO> getReply(Criteria cri) {
		return mapper.getReply(cri);
	}

	public List<MemberVO> getMember(Criteria cri) {
		return mapper.getMember(cri);
	}
	
	@Transactional
	public boolean deleteMember(String userid) {
		mapper.deleteAuth(userid);
		mapper.deleteRemember(userid);
		mapper.deleteMemberReply(userid);
		return mapper.deleteMember(userid)==1;
	}


	public List<BoardDTO> getBoardDate(Criteria cri, String date) {
		
		return mapper.getBoardDate(cri,date);
	}

	public List<ReplyDTO> getReplyDate(Criteria cri, String date) {
		return mapper.getReplyDate(cri,date);
	}

	public List<MemberVO> getMemberDate(Criteria cri, String date) {
		return mapper.getMemberDate(cri,date);
	}

	public boolean updateAuth(String auth, String userid) {
		return mapper.updateAuth(auth, userid)==1;
	}

	public int boardTCount() {
		return mapper.boardTCount();
	}

	public int replyTCount() {
		return mapper.replyTCount();
	}

	public int memberTCount() {
		return mapper.memberTCount();
	}

	public int boardTCountD(String date) {
		return mapper.boardTCountD(date);
	}

	public int replyTCountD(String date) {
		return mapper.replyTCountD(date);
	}

	public int memberTCountD(String date) {
		return mapper.memberTCountD(date);
	}


}
