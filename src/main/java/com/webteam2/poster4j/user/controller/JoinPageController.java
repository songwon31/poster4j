package com.webteam2.poster4j.user.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.webteam2.poster4j.dto.Customer;
import com.webteam2.poster4j.dto.Receiver;
import com.webteam2.poster4j.service.CustomerService;
import com.webteam2.poster4j.service.CustomerService.JoinResult;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class JoinPageController {
	@Resource
	private CustomerService customerService;
	
	@GetMapping("/join")
	public String join() {
		return "user/joinForm";
	}
	
	@PostMapping("/join")
	public String join(Customer customer, Model model) {
		JoinResult result = customerService.join(customer);
		if(result == JoinResult.FAIL_DUPLICATED_MID) {
			String error = "이미 사용중인 아이디입니다.";
			model.addAttribute("error", error);
			return "user/joinForm";
		} else {
			customerService.join(customer);
			log.info("join success");
			return "redirect:/user/loginForm";
		}
	}
}
