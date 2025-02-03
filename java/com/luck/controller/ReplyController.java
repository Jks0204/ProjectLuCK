package com.luck.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.luck.domain.Criteria;
import com.luck.domain.ReplyDTO;
import com.luck.domain.ReplyPageDTO;
import com.luck.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService service; //자동주입.생성자의존성주입
	
	//등록
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value="/new",consumes="application/json",produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyDTO dto){
		int insertCount=service.register(dto); //영향을 받은 행의 수 리턴
		//영향을 받은 행의 수가 1이면 정상적으로 insert된 것임.
		return insertCount==1 ? new ResponseEntity<>("success",HttpStatus.OK)
								: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
	}
	//목록 with paging
	@GetMapping(value="/pages/{bno}/{page}",produces= {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("bno") Long bno){
		Criteria cri=new Criteria(page,10);
		
		return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
	}
	//상세보기
	@GetMapping(value="/{rno}",produces= {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyDTO> get(@PathVariable("rno") Long rno){
		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}
	//수정. put, patch 방식 모두 처리
	@PreAuthorize("principal.username == #dto.replyer")
	@RequestMapping(method= {RequestMethod.PUT,RequestMethod.PATCH},
				value="/{rno}",consumes="application/json",produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyDTO dto, @PathVariable("rno") Long rno){
		dto.setRno(rno);
		
		return service.modify(dto)==1 ? new ResponseEntity<>("success",HttpStatus.OK): 
										 new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//삭제. delete방식
	@PreAuthorize("principal.username == #replyer")
	@DeleteMapping(value="/{rno}",produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno, @RequestParam("replyer") String replyer){
		return service.remove(rno)==1 ? new ResponseEntity<>("success",HttpStatus.OK) : 
										new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	

}
