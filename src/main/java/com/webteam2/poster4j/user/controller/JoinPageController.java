package com.webteam2.poster4j.user.controller;

import javax.annotation.Resource;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webteam2.poster4j.dto.Customer;
import com.webteam2.poster4j.dto.Receiver;
import com.webteam2.poster4j.service.CustomerService;
import com.webteam2.poster4j.service.CustomerService.JoinResult;
import com.webteam2.poster4j.service.ReceiverService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class JoinPageController {
	@Resource
	private CustomerService customerService;
	
	@Resource
	private ReceiverService receiverService;
	
	@GetMapping("/join")
	public String join() {
		return "user/joinForm";
	}
	
	@PostMapping("/join")
	public String join(Customer customer, Model model,
					@RequestParam(value="customerPasswordCheck") String customerPasswordCheck,
					@RequestParam(value="receiverZip") String receiverZip,
					@RequestParam(value="receiverAddress") String receiverAddress,
					@RequestParam(value="receiverAddressDetail", required=false) String receiverAddressDetail
					) {
		//체크박스에 체크가 되어있지 않을 경우 값 저장
		if(customer.getCustomerTermAgree() == null) {
			customer.setCustomerTermAgree("FALSE");
		}
		if(customer.getCustomerInfoAgree() == null) {
			customer.setCustomerInfoAgree("FALSE");
		}
		if(customer.getCustomerSmsAgree() == null) {
			customer.setCustomerSmsAgree("FALSE");
		}
		if(customer.getCustomerEmailAgree() == null) {
			customer.setCustomerEmailAgree("FALSE");
		}
		
		JoinResult result = customerService.join(customer);
		
		//비밀번호 확인을 위한 PasswordEncoder
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();

		//아이디 중복체크
		if(result == JoinResult.FAIL_DUPLICATED_MID) {
			String idError = "이미 사용중인 아이디입니다.";
			model.addAttribute("error", idError);
			return "user/joinForm";
		} /*else if(!passwordEncoder.matches(customer.getCustomerPassword(), passwordEncoder.encode(customerPasswordCheck))) {
			//비밀번호 확인이 비밀번호와 일치하지 않을 경우
			log.info("입력하신 비밀번호가 일치하지 않습니다.");
			String pwError = "입력하신 비밀번호가 일치하지 않습니다.";
			model.addAttribute("error", pwError);
			return "user/joinForm";
		}*/ else {
			//비밀번호 확인이 비밀번호와 일치하는 경우
			customerService.join(customer);
			
			//receiver 객체에 데이터 저장
			Receiver receiver = new Receiver();
			receiver.setCustomerId(customer.getCustomerId());
			log.info("" + receiver.getCustomerId());
			receiver.setReceiverName(customer.getCustomerName());
			receiver.setReceiverZip(receiverZip);
			receiver.setReceiverAddress(receiverAddress);
			receiver.setReceiverAddressDetail(receiverAddressDetail);
			receiver.setReceiverTelno(customer.getCustomerTelno());
			receiverService.firstRegister(receiver);
			
			log.info("join success");
			return "user/loginForm";
		}
	}
}
