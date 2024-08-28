package com.luck.controller;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.luck.domain.BoardAttachDTO;
import com.luck.domain.BoardDTO;
import com.luck.domain.Criteria;
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
	
	//목록
	@GetMapping("/list")
	public void list(Model model) {
		//request.setAttribute("list", service.getList()); 와 같은 역할
		// 리턴값이 void이면 url 주소와 같은 이름인 list.jsp로 포워딩
		model.addAttribute("list", service.getList()); // "list"는 attribute명
	}
	//등록화면으로 이동
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {}
	//등록처리
	@PostMapping("/register")	
	@PreAuthorize("isAuthenticated()")
	public String register(BoardDTO board, RedirectAttributes rttr) {
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno()); // result라는 이름으로 글번호 전달
		return "redirect:/board/list"; // "redirect:"는 sendRedirect()역할
	}
	
	
	//정관수 시작 ----------------------------------------------------------
	//수정처리
	@GetMapping("/modify")
	@PreAuthorize("principal.username == #board.writer")
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri,Model model) {
		model.addAttribute("board", service.get(bno));
	}
	
	@PostMapping("/modify")
	@PreAuthorize("principal.username == #board.writer") // 받아오는 값 board 의 writer
	public String modify(BoardDTO dto, RedirectAttributes rttr) {

		if(service.update(dto)) {
			rttr.addFlashAttribute("result", "success");
		}
		// 수정된 글로 보내주기
		return "redirect:/board/get?bno="+dto.getBno();
	}
	//삭제
	@PreAuthorize("principal.username == #writer") // 받아오는 값(parameter)의 writer
	@PostMapping("/remove")
	public String remove(Long bno,Criteria cri,RedirectAttributes rttr,String writer) {
		//첨부파일목록
		List<BoardAttachDTO> attachList=service.getAttachList(bno);		
		
		if(service.delete(bno)) {
			//실제 파일 삭제
			service.deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/list"+cri.getListLink();
	}
	
	//정관수 끝-------------------------------------------------------------
}
