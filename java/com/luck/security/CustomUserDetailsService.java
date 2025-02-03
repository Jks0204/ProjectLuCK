package com.luck.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.luck.domain.MemberVO;
import com.luck.mapper.MemberMapper;
import com.luck.security.domain.CustomUser;

import lombok.Setter;

public class CustomUserDetailsService implements UserDetailsService{
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper memberMapper; //주입

	// 회원 아이디로 회원정보 조회
	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
		
		MemberVO dto=memberMapper.read(userid);
		return dto==null ? null : new CustomUser(dto);
	}

}
