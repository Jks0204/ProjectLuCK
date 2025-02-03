package com.luck.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.luck.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member")
public class SignupController  {
		
	    @GetMapping("/signUp")
	    public void sign() { }
	 	@Autowired
	    private UserService userService;

	    @PostMapping("/signUp")
	    public String signup(
	    					 @RequestParam String userid,
	    					 @RequestParam String userpw,
	    					 @RequestParam String name,
	                         @RequestParam String phone,
	                         @RequestParam String email,
	                         @RequestParam String role) {
	    	 // role값에 따라서 수정
	    	String auth ="";
	        if ("user".equals(role)) {
	        	auth = "ROLE_USER";
	        } else if ("journalist".equals(role)) {
	        	auth = "ROLE_MEMBER";
	        } else {
	        	auth = "ROLE_ADMIN";
	        }
	    	
	        userService.registerUser(userid, userpw, name, phone, email);
	        log.info("회원가입 완료");
	        userService.registerUserauth(userid, auth);
	        log.info("회원권한 등록 완료");
	        return "redirect:/board/list";
	    }
	    
	    @GetMapping("/checkUsername")
	    public String checkId(@RequestParam("userid") String userid, Model model) {
	        int result = userService.confirmID(userid);
	        model.addAttribute("userid", userid);
	        model.addAttribute("result", result);
	        return "/member/checkUsername";
	    }
	    
}
