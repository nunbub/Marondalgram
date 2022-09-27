package com.nunbub.marondalgram.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PermissionInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler) throws IOException {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		String uri = request.getRequestURI();
		
		// 로그인이 되어 있는 경우
		// 로그인 페이지, 회원가입 페이지를 접속하면 
		// 타임라인 페이지로 이동
		if(userId != null) {
			
			// 회원가입 = /user/signup/view
			// 로그인 = /user/signin/view
			if(uri.startsWith("/user")) {
				
				response.sendRedirect("/post/timeline/view");
				
				return false;
				
			}
			
		} else {
			
			// 로그인이 되어 있지 않은 경우
			// 타임라인, 입력화면 화면 접속 시도시
			// 로그인 페이지로 이동
			if(uri.startsWith("/post")) {
				
				response.sendRedirect("/user/signin/view");
				
				return false;
				
			}
			
		}
		
		return true;
		
	}
	
	
	@Override
	public void postHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler
			, ModelAndView modelAndView) {
		
	}
	
	
	@Override
	public void afterCompletion(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler
			, Exception ex) {
		
	}
}
