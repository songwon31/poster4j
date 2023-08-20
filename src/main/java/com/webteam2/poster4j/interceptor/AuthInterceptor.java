package com.webteam2.poster4j.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import com.webteam2.poster4j.dto.Customer;
import com.webteam2.poster4j.interceptor.Auth.Role;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AuthInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//요청 처리 메서드에 @Auth가 붙어 있는지 확인
		HandlerMethod handlerMethod = (HandlerMethod)handler;
		Auth auth = handlerMethod.getMethodAnnotation(Auth.class);
		
		
		
		if (auth == null) {
			//@Auth가 안 붙어있을 경우
			return true;
		} else {
			//@Auth가 붙어 있을 경우
			if (auth.value() == Role.ADMIN) {
				HttpSession session = request.getSession();
				Customer customer = (Customer) session.getAttribute("customerLogin");
				
				//로그인 여부 검사
				if (customer == null) {
					response.sendRedirect(request.getContextPath() + "/login");
					return false;
				}
				
				//로그인 사용자가 관리자 권한을 가지고 있는지 검사
				boolean isAdmin = false;
				if (customer.getCustomerId().equals("admin")) {
					isAdmin = true;
				}
				if (isAdmin) {
					return true;
				} else {
					response.sendRedirect(request.getContextPath());
				}
			} else {
				return true;
			}
		}
		
		return true;
	}
}
