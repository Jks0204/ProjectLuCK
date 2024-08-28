package com.luck.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.util.UriComponentsBuilder;


@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum;
	private int amount;
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum=pageNum;
		this.amount=amount;
	}
	// 롬복이 getTypeArr와 짝이되는 typeArr필드를 자동 생성
	public String[] getTypeArr() {
		//type이 없으면 빈문자열배열을 리턴 그렇지 않으면 한글자씩 분리해서 배열에 담아서 리턴
		return type==null?new String[] {}:type.split("");
	}
	//url parameter생성
	public String getListLink() {
		UriComponentsBuilder builder=UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();
	}

}
