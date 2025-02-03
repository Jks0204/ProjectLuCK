package com.luck.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.luck.domain.BoardDTO;
import com.luck.domain.Criteria;
import com.luck.domain.MemberVO;
import com.luck.domain.ReplyDTO;

public interface AdminMapper {
	public List<BoardDTO> getBoard(Criteria cri);
	public List<ReplyDTO> getReply(Criteria cri);
	public List<MemberVO> getMember(Criteria cri);
	public int deleteMember(String userid);
	public void deleteAuth(String userid);
	public void deleteRemember(String userid);
	
	public List<BoardDTO> getBoardDate(@Param("cri") Criteria cri, @Param("date") String date);
	public List<ReplyDTO> getReplyDate(@Param("cri") Criteria cri, @Param("date") String date);
	public List<MemberVO> getMemberDate(@Param("cri") Criteria cri, @Param("date") String date);
	
	public int boardTCount();
	public int replyTCount();
	public int memberTCount();
	public int boardTCountD(String date);
	public int replyTCountD(String date);
	public int memberTCountD(String date);
	
	
	public int updateAuth(@Param("auth") String auth, @Param("userid") String userid);
	
	public void deleteMemberReply(String userid);
}
