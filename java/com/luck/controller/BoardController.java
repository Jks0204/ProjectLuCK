package com.luck.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.luck.domain.BoardAttachDTO;
import com.luck.domain.BoardDTO;
import com.luck.domain.Criteria;
import com.luck.domain.PageDTO;
import com.luck.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
//변경점테스트
@Controller
@RequestMapping("/board/*")
@AllArgsConstructor
@Log4j
public class BoardController {
	
	private BoardService service;//자동주입. 생성자의존성주입
	
//	//목록
//	@GetMapping("/list")
//	public void list(Model model) {
//		//request.setAttribute("list", service.getList()); 와 같은 역할
//		// 리턴값이 void이면 url 주소와 같은 이름인 list.jsp로 포워딩
//		model.addAttribute("list", service.getList()); // "list"는 attribute명
//	}
	
	//등록화면으로 이동
	@GetMapping("/register")
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public void register() {}
	//등록처리
	@PostMapping("/register")	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String register(BoardDTO board, RedirectAttributes rttr) {
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno()); // result라는 이름으로 글번호 전달
		return "redirect:/board/get?bno="+board.getBno(); // "redirect:"는 sendRedirect()역할
	}
	
	
	//정관수 시작 ----------------------------------------------------------
	//수정처리
	@GetMapping("/get")
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri,Model model) {
		service.plus(bno);
		model.addAttribute("board", service.get(bno));
		model.addAttribute("side",service.getSideBar());
	}
	
	@GetMapping("/modify")
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public void modify(@RequestParam("bno") Long bno, Model model) {
		model.addAttribute("board", service.get(bno));
	}
	
	@PostMapping("/modify")
	@PreAuthorize("principal.username == #dto.writer") // 받아오는 값 boardDTO 의 writer
	public String modify(BoardDTO dto, RedirectAttributes rttr) {

		if(service.update(dto)) {
			rttr.addFlashAttribute("result", "기사가 성공적으로 수정되었습니다.");
		}
		// 수정된 글로 보내주기
		return "redirect:/board/get?bno="+dto.getBno();
	}
	//삭제
	@PostMapping("/remove")
	@PreAuthorize("principal.username == #writer") // 받아오는 값(parameter)의 writer
	public String remove(Long bno,RedirectAttributes rttr,String writer) {
		//첨부파일목록
		List<BoardAttachDTO> attachList=service.getAttachList(bno);		
		
		if(service.delete(bno)) {
			//실제 파일 삭제
			service.deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "기사가 성공적으로 삭제되었습니다.");
		}
		
		return "redirect:/board/list";
	}
	
	//정관수 끝-------------------------------------------------------------
	
	//김재혁 시작-------------------------------------------------------------------
	//상세보기
	//목록 with paging
	@GetMapping("/list")
	public void list(Criteria cri,Model model) {	
		log.info("cri : "+cri);
		List<BoardDTO> boards = service.getList(cri);
		model.addAttribute("list", service.getList(cri));
		
		for (BoardDTO board : boards) {
	        board.setAttachList(service.getAttachList(board.getBno()));
	    }
		
		int total=0;
		if(cri.getCategory()==null||cri.getCategory()=="") {
			total=service.getTotal(cri); //전체글수
		} else {
			total=service.getCategoryCount(cri);
		}
		
		model.addAttribute("pageMaker", new PageDTO(cri,total));
		
		List<BoardDTO> sideBoard = service.getSideBar();
		model.addAttribute("side",service.getSideBar());
		
		for (BoardDTO board : sideBoard) {
	        board.setAttachList(service.getAttachList(board.getBno()));
	    }
		
	}
	//첨부파일목록
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachDTO>> getAttachList(Long bno){
		return new ResponseEntity<>(service.getAttachList(bno),HttpStatus.OK);
	}
	
	//김재혁 끝---------------------------------------------------------------------
}
