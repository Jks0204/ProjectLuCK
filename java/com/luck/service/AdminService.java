package com.luck.service;

import java.util.List;

import com.luck.domain.BoardDTO;
import com.luck.domain.Criteria;
import com.luck.domain.MemberVO;
import com.luck.domain.ReplyDTO;

public interface AdminService {
	public List<BoardDTO> getBoard(Criteria cri);
	public List<ReplyDTO> getReply(Criteria cri);
	public List<MemberVO> getMember(Criteria cri);
	public boolean deleteMember(String userid);
	
	public List<BoardDTO> getBoardDate(Criteria cri, String date);
	public List<ReplyDTO> getReplyDate(Criteria cri, String date);
	public List<MemberVO> getMemberDate(Criteria cri, String date);
	
	public int boardTCount();
	public int replyTCount();
	public int memberTCount();
	public int boardTCountD(String date);
	public int replyTCountD(String date);
	public int memberTCountD(String date);
	
	public boolean updateAuth(String auth, String userid);
}
