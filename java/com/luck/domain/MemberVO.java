package com.luck.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String userid;
	private String userpw;
	private String name;
	private String enabled;
	private Date regdate;
	private String phone;
	private String email;
	private List<AuthVO> authList;
}
