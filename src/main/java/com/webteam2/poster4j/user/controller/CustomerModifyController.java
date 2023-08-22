package com.webteam2.poster4j.user.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webteam2.poster4j.dto.Customer;
import com.webteam2.poster4j.interceptor.Login;
import com.webteam2.poster4j.service.CustomerService;
import com.webteam2.poster4j.service.CustomerService.LoginResult;

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
	public String customerModify(Model model, HttpSession session,
			String customerId, String customerPassword) 
	{
		Customer verifyCustomer = new Customer();
		verifyCustomer.setCustomerId(customerId);
		verifyCustomer.setCustomerPassword(customerPassword);
		LoginResult result = customerService.login(verifyCustomer);
		if (result == LoginResult.SUCCESS) {
			Customer customer = (Customer)session.getAttribute("customerLogin");
			model.addAttribute("customer", customer);
			return "user/customerModify";
		} else {
			return "redirect:/user/customerVerification";
		}
	}
	
	@PostMapping("/modifyName")
	public void modifyName(@RequestParam("customerName")String customerName, HttpSession session) {
		Customer customer = (Customer)session.getAttribute("customerLogin");
		customer.setCustomerName(customerName);
		customerService.modifyCustomerName(customer);
		session.setAttribute("customerLogin", customer);
	}
	
	@PostMapping("/modifyTelno")
	public void modifyTelno(@RequestParam("customerTelno")String customerTelno, HttpSession session) {
		Customer customer = (Customer)session.getAttribute("customerLogin");
		customer.setCustomerTelno(customerTelno);
		customerService.modifyCustomerTelno(customer);
		session.setAttribute("customerLogin", customer);
	}
	
	@PostMapping("/modifyEmail")
	public void modifyEmail(@RequestParam("customerEmail")String customerEmail, HttpSession session) {
		Customer customer = (Customer)session.getAttribute("customerLogin");
		customer.setCustomerEmail(customerEmail);
		customerService.modifyCustomerEmail(customer);
		session.setAttribute("customerLogin", customer);
	}
	
	@PostMapping("/modifyPassword")
	@ResponseBody
	public String modifyPassword(Model model, HttpSession session,
			@RequestParam("currentPassword")String currentPassword, 
			@RequestParam("newPassword1")String newPassword1, 
			@RequestParam("newPassword2")String newPassword2) {
		Customer customer = (Customer)session.getAttribute("customerLogin");
		customer.setCustomerId(customer.getCustomerId());
		customer.setCustomerPassword(currentPassword);
		LoginResult result = customerService.login(customer);
		if (result == LoginResult.SUCCESS) {
			if (newPassword1.equals(newPassword2)) {
				PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
				String newPassword = passwordEncoder.encode(newPassword1);
				customer.setCustomerPassword(newPassword);
				customerService.modifyCustomerPassword(customer);
				session.setAttribute("customerLogin", customer);
				return "success";
			}
		}
		return "false";
	}
	
	@PostMapping("/smsCheck")
	public void smsCheck(HttpSession session) {
		log.info("smsCheck");
		Customer customer = (Customer)session.getAttribute("customerLogin");
		customerService.checkSmsAgree(customer);
		customer.setCustomerSmsAgree("TRUE");
		session.setAttribute("customerLogin", customer);
	}
	
	@PostMapping("/smsUncheck")
	public void smsUncheck(HttpSession session) {
		log.info("smsUncheck");
		Customer customer = (Customer)session.getAttribute("customerLogin");
		customerService.uncheckSmsAgree(customer);
		customer.setCustomerSmsAgree("FALSE");
		session.setAttribute("customerLogin", customer);
	}
	
	@PostMapping("/emailCheck")
	public void emailCheck(HttpSession session) {
		log.info("emailUncheck");
		Customer customer = (Customer)session.getAttribute("customerLogin");
		customerService.checkEmailAgree(customer);
		customer.setCustomerEmailAgree("TRUE");
		session.setAttribute("customerLogin", customer);
	}
	
	@PostMapping("/emailUncheck")
	public void emailUncheck(HttpSession session) {
		log.info("emailUncheck");
		Customer customer = (Customer)session.getAttribute("customerLogin");
		customerService.uncheckEmailAgree(customer);
		customer.setCustomerEmailAgree("FALSE");
		session.setAttribute("customerLogin", customer);
	}
	
	@RequestMapping("/customerWithdrawal")
	@Login
	public String customerWithdrawal(String customerId, HttpSession session) {
		session.removeAttribute("customerLogin");
		customerService.withdrawal(customerId);
		
		return "redirect:/";
	}
}
