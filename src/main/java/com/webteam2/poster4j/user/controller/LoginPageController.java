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
public class LoginPageController {
	@Resource
	private CustomerService customerService;
	
	@GetMapping("/login")
	public String loginForm() {
		return "user/loginForm";
	}
	
	@PostMapping("/login")
	public String login(Customer customer, Model model, HttpSession session) {
		LoginResult result = customerService.login(customer);
	      String error = "";
	      if(result == LoginResult.FAIL_MID) {
	         error = "MID가 없습니다.";
	      }else if(result == LoginResult.FAIL_MPASSWORD) {
	         error = "MPASSWORD가 틀립니다.";
	      }else {
	    	  Customer dbCustomer = customerService.getList(customer.getCustomerId());
	    	  session.setAttribute("customerLogin", dbCustomer);
	    	  if(customer.getCustomerId().equals("admin")) {
	    		  //관리자 로그인
	    		  log.info("admin login success");
	    		  return "redirect:/admin/orderBoard";
	    	  } else {
	    		  //사용자 로그인
	    		  log.info("user login success");
	    		  return "redirect:/";
	    	  }
	      }
	      
	      model.addAttribute("error", error);
	      return "user/loginForm";
	}
}
