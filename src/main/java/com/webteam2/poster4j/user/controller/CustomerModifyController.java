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

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CustomerModifyController {
	@Resource
	private CustomerService customerService;
	
	@GetMapping("/customerModify")
	@Login
	public String customerVerification(Model model, HttpSession session) {
		Customer customer = (Customer)session.getAttribute("customerLogin");
		model.addAttribute("customer", customer);
		return "user/customerVerification";
	}
	
	@PostMapping("/customerModify")
	@Login
	public String customerModify(HttpSession session,
			String customerId, String customerPassword) 
	{
		Customer loginCustomer = (Customer)session.getAttribute("customerLogin");
		if (customerId.equals(loginCustomer.getCustomerId()) && customerPassword.equals(loginCustomer.getCustomerPassword())) {
			return "user/customerModify";
		} else {
			return "redirect:/user/customerVerification";
		}
	}
	
	@PostMapping("/customerModifySubmit")
	@Login
	public String customerModifySubmit(Customer customer) {
		
		return "redirect:/";
	}
	
	@PostMapping("/customerWithdrawal")
	@Login
	public String customerWithdrawal(Customer customer) {
		
		return "redirect:/";
	}
}
