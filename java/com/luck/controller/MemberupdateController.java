package com.luck.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.luck.domain.MemberVO;
import com.luck.mapper.MemberMapper;
import com.luck.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member")
public class MemberupdateController  {
	@Autowired
    private UserService userService; //주입
	@Autowired
	private MemberMapper memberMapper; //주입
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@GetMapping("/memberUpdate")
    public String updateForm( Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String userid = userDetails.getUsername();
        // 사용자 정보를 불러와서 Model에 추가 (필요하다면)
        MemberVO dto=memberMapper.read(userid); // 사용자 정보 불러옴
        log.info(dto);
        model.addAttribute("member", dto);
        // 추가로 사용자 정보를 불러와서 form에 미리 채워 넣을 수도 있음.
        return "/member/memberUpdate"; // 회원 정보 수정 페이지로 이동
    }

    @PostMapping("/memberUpdate")
    public String memberUpdate(
    		@RequestParam ("userid") String userid,
            @RequestParam("userpw") String userpw,
            @RequestParam("phone") String phone,
            @RequestParam("email") String email) {
        

        // 회원 정보 수정 로직 실행
        userService.updateUser(userid, userpw, phone, email);

        // 업데이트가 성공한 후 리다이렉션할 페이지로 이동 (예: 마이페이지)
        return "redirect:/board/list";
    }
    
    @GetMapping("/passCheck")
    public String passCheck( Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String userid = userDetails.getUsername();
        // 사용자 정보를 불러와서 Model에 추가 (필요하다면)
        MemberVO dto=memberMapper.read(userid); // 사용자 정보 불러옴
        model.addAttribute("member", dto);
        // 추가로 사용자 정보를 불러와서 form에 미리 채워 넣을 수도 있음.
        return "/member/passCheck"; // 회원 정보 수정 페이지로 이동
    }
    @PostMapping("/passCheck")
    public void acessOk(
    		@RequestParam ("userid") String userid,
            @RequestParam("userpw") String userpw,
            HttpServletResponse response,
            Model model)throws IOException{
    	
        // DB에서 사용자 정보를 가져옴
        MemberVO dto = memberMapper.read(userid);
        //자바스크립트 인코딩
        response.setContentType("text/html;charset=UTF-8");
        //DB 비밀번호 비교
    	if(!passwordEncoder.matches(userpw, dto.getUserpw())) {
    		//자바 스크립트 알람 전송
    		String script = "<script type='text/javascript'>" +
                    "alert('비밀번호가 일치하지 않습니다.');" +
                    "history.back();" +  // 이전 페이지로 돌아가기
                    "</script>";
		    response.getWriter().write(script);
		    response.getWriter().flush();
            return; // 비밀번호 확인 페이지로 다시 이동
    	}
        // 비밀번호가 일치할 경우 JavaScript를 통해 팝업을 닫고 부모 창을 리다이렉트
	    String script = "<script type='text/javascript'>" +
	                    "window.opener.location.href='/member/memberUpdate';" + // 부모 창 리다이렉트
	                    "window.close();" +  // 팝업 창 닫기
	                    "</script>";
	    response.getWriter().write(script);
	    response.getWriter().flush();
    }

	    
}
