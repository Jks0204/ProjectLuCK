package com.luck.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		// 역할 이름 목록
		List<String> roleNames=new ArrayList<>();
		auth.getAuthorities().forEach(authority->{
			roleNames.add(authority.getAuthority());
		});
		
		
		System.out.println("RoleName: "+roleNames);
		// admin계정이면 admin사이트로 이동
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/sample/admin");
			return;
		}else if(roleNames.contains("ROLE_USER")) {
			response.sendRedirect("/board/list");
			return;
		}else if(roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/board/list");
			return;
		}
		
		// 캐시로 uri정보를 가져와 해당 uri로 이동
		RequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		System.out.println(savedRequest+"저장된 요청");
		if(savedRequest!=null) {
			String uri=savedRequest.getRedirectUrl();
			System.out.println("로그인 이동전 페이지 uri"+uri);
			requestCache.removeRequest(request, response);
			response.sendRedirect(uri);
			return;
		} else {
			// uri가 남아있지 않으면
			if(requestCache!=null) {
				requestCache.removeRequest(request, response);
			}
			response.sendRedirect("/");		
		}
		
	}

}
