package com.webteam2.poster4j.user.controller;

import javax.annotation.Resource;

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

		if(result == JoinResult.FAIL_DUPLICATED_MID) {
			String error = "이미 사용중인 아이디입니다.";
			model.addAttribute("error", error);
			return "user/joinForm";
		} else {
			customerService.join(customer);
			
			//receiver 객체에 데이터 저장
			Receiver receiver = new Receiver();
			receiver.setCustomerId(customer.getCustomerId());
			log.info("" + receiver.getCustomerId());
			receiver.setReceiverName(customer.getCustomerName());
			receiver.setReceiverZip(receiverZip);
			receiver.setReceiverAddress(receiverAddressDetail);
			receiver.setReceiverAddressDetail(receiverAddressDetail);
			receiver.setReceiverTelno(customer.getCustomerTelno());
			receiverService.firstRegister(receiver);
			
			log.info("join success");
			return "user/loginForm";
		}
	}
}
