package com.webteam2.poster4j.user.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.webteam2.poster4j.dto.Customer;
import com.webteam2.poster4j.interceptor.Login;
import com.webteam2.poster4j.service.CustomerService;
import com.webteam2.poster4j.service.CustomerService.LoginResult;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MyPageController {
	@Resource
	private CustomerService customerService;
	
	@GetMapping("/mypage")
	@Login
	public String mypage() {
		return "user/myPage";
	}
	
	@GetMapping("/logout")
	@Login
	public String logout(Customer customer, HttpSession session) {
		session.removeAttribute("customerLogin");
		log.info("logout");
		return "redirect:/";
	}
}
