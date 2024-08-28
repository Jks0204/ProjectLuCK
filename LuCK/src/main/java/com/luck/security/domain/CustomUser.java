package com.luck.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.luck.domain.MemberVO;

import lombok.Getter;


@Getter
public class CustomUser extends User{
	
	private MemberVO member;

	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);		
	}
	
	//생성자오버로딩
	public CustomUser(MemberVO dto) {
		//부모클래스 생성자호출
		super(dto.getUserid(), dto.getUserpw(), dto.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));

		
		this.member=dto;
	}
	
	

}
