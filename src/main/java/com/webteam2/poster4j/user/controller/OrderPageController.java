package com.webteam2.poster4j.user.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam2.poster4j.dto.Customer;
import com.webteam2.poster4j.dto.Receiver;
import com.webteam2.poster4j.service.ReceiverService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OrderPageController {
	@Resource
	ReceiverService receiverService;
	
	@RequestMapping("/order")
	public String order(HttpSession session, Model model) {
		//세션에 저장된 customer 정보
		Customer customer = (Customer)session.getAttribute("customerLogin");
		if (customer == null) {
			// 로그인 정보가 없으면 로그인 페이지로 이동하거나 필요한 처리를 수행
			return "redirect:/login"; // 로그인 페이지로 리다이렉트
		}
		log.info("주문페이지 실행");
		
		Receiver defaultReceiver = receiverService.getDefaultReceiver(customer.getCustomerId());
		
		
		List<Receiver> list = receiverService.getListByCustomerId(customer.getCustomerId());		
		
		model.addAttribute("defaultReceiver", defaultReceiver);
		model.addAttribute("receivers", list);
		
		return "user/orderForm";
	}
}
