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
import com.luck.domain.MemberVO;
import com.luck.domain.PageDTO;
import com.luck.domain.ReplyDTO;
import com.luck.service.AdminService;
import com.luck.service.BoardService;
import com.luck.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
//변경점테스트
@Controller
@RequestMapping("/admin/*")
@AllArgsConstructor
@Log4j
public class AdminController {
	
	private AdminService service;
	private BoardService bService;
	private ReplyService rService;
	
	@GetMapping("/main")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void get() {}
	
	@GetMapping("/board")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void board(Model model, String date,@ModelAttribute("cri") Criteria cri) {
		List<BoardDTO> list;
		int total=0;
		if(date==""||date==null) {
			list=service.getBoard(cri);
			total=service.boardTCount();
		} else {
			list=service.getBoardDate(cri,date);
			total=service.boardTCountD(date);
		}
		for (BoardDTO board : list) {
	        board.setAttachList(bService.getAttachList(board.getBno()));
	    }
		model.addAttribute("date",date);
		model.addAttribute("board", list);
		model.addAttribute("pages", new PageDTO(cri,total));
	}
	
	@GetMapping("/reply")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void reply(Model model,String date,@ModelAttribute("cri") Criteria cri) {
		List<ReplyDTO> list;
		int total=0;
		if(date==""||date==null) {
			list=service.getReply(cri);
			total=service.replyTCount();
		} else {
			list=service.getReplyDate(cri,date);
			total=service.replyTCountD(date);
		}
		model.addAttribute("date",date);
		model.addAttribute("reply", list);
		model.addAttribute("pages", new PageDTO(cri,total));
	}
	
	
	@GetMapping("/member")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void member(Model model,String date,@ModelAttribute("cri") Criteria cri) {
		List<MemberVO> list;
		int total=0;
		if(date==""||date==null) {
			list=service.getMember(cri);
			total=service.memberTCount();
		} else {
			list=service.getMemberDate(cri,date);
			total=service.memberTCountD(date);
		}
		model.addAttribute("date",date);
		model.addAttribute("member", list);
		System.out.println("@@@@@@@@@@@@@"+cri);
		model.addAttribute("pages", new PageDTO(cri,total));
	}
	
	//게시글 삭제
	@PostMapping("/deleteBoard")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String removeBoard(@RequestParam("bno") Long bno,RedirectAttributes rttr, @RequestParam("date") String date) {
		List<BoardAttachDTO> attachList=bService.getAttachList(bno);		
		
		if(bService.delete(bno)) {
			bService.deleteFiles(attachList);
			rttr.addFlashAttribute("msg", bno);			
		}
		rttr.addAttribute("date",date);
		return "redirect:/admin/board";
	}
	
	// 댓글 삭제
	@PostMapping("/deleteReply")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String removeReply(@RequestParam("rno") Long rno, RedirectAttributes rttr, @RequestParam("date") String date){
		String dReplyer=rService.get(rno).getReplyer();
		String dRname=rService.get(rno).getRname();
		Long dBno=rService.get(rno).getBno();
		String dTitle=bService.get(dBno).getTitle();
		if(dTitle.length()>=10) {			
			dTitle=dTitle.substring(0, 9)+"..";
		}
		rttr.addFlashAttribute("dReplyer",dReplyer);
		rttr.addFlashAttribute("dRname",dRname);
		rttr.addFlashAttribute("dBno",dBno);
		rttr.addFlashAttribute("dTitle",dTitle);
		rttr.addAttribute("date",date);
		rService.remove(rno);
		return "redirect:/admin/reply";
	}
	
	// 유저 강제 탈퇴
	@PostMapping("/deleteMember")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String remove(@RequestParam("userid") String userid,RedirectAttributes rttr, @RequestParam("date") String date) {
		String msg="";
		if(service.deleteMember(userid)) {
			msg="성공";
			rttr.addFlashAttribute("msg",msg);
			rttr.addFlashAttribute("idn",userid);
			rttr.addAttribute("date",date);
		} else {		
			msg="실패";
			rttr.addFlashAttribute("msg",msg);
			rttr.addAttribute("date",date);
		}
		
		return "redirect:/admin/member";
	}
	
	// 유저 권한 변경
	@PostMapping("/updateAuth")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String updateAuth(@RequestParam("userid") String userid, @RequestParam("auth") String auth, RedirectAttributes rttr, @RequestParam("date") String date) {
		
		System.out.println(userid);
		System.out.println(auth);
		String updateMsg="";
		if(service.updateAuth(auth, userid)){
			if(auth.equals("ROLE_MEMBER")) {
				updateMsg=userid+"님의 권한변경 (일반유저->기자) 성공";				
			} else if(auth.equals("ROLE_USER")) {
				updateMsg=userid+"님의 권한변경 (기자->일반유저) 성공";				
			}
		} else {
			updateMsg=userid+"님의 권한변경 실패";
		}
		rttr.addFlashAttribute("updateMsg",updateMsg);
		rttr.addAttribute("date",date);
		return "redirect:/admin/member";
	}

}
