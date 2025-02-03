package com.luck.mapper;

import com.luck.domain.MemberVO;

public interface MemberMapper {
	//회원정보
	public MemberVO read(String userid);

}
