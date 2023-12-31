package com.webteam2.poster4j.user.controller;
	
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;

import com.webteam2.poster4j.dto.Customer;
import com.webteam2.poster4j.dto.Receiver;
import com.webteam2.poster4j.service.ReceiverService;
import com.webteam2.poster4j.validator.ReceiverValidator;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AddressRegisterController {
	@Resource
	private ReceiverService receiverService;
	
	
	@GetMapping("/addressRegister")
	public String AddressRegisterForm() {
		log.info("배송지 등록 실행");
		return "user/addressRegisterForm";
	}
	
	
	@InitBinder("receiver")
	public void ReceiverValidator(WebDataBinder binder) {
		binder.setValidator(new ReceiverValidator());
	}
	
	
	@PostMapping("/addressRegister")
	public String AddressRegister(HttpSession session, @Valid Receiver receiver, Errors errors) {
		log.info("배송지 등록 폼 전송");
		if (errors.hasErrors()) {
			log.info("이게문젠가");
			return "user/addressRegisterForm";
		}
		
		Customer customer = (Customer)session.getAttribute("customerLogin");
		if (customer == null) {
			// 로그인 정보가 없으면 로그인 페이지로 이동하거나 필요한 처리를 수행
			return "redirect:/login"; // 로그인 페이지로 리다이렉트
		}
		
		log.info("param1: " + receiver.getReceiverName());
		// errors.rejectValue(...)가 한 번이라도 호출되었다면 hasErrors()는 true를 리턴
		
		
		receiver.setCustomerId(customer.getCustomerId());
		receiverService.register(receiver);
		
		
		
		return "redirect:/addressList";
	}
}
