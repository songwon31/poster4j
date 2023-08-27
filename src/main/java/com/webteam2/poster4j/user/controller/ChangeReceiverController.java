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

@Controller
@Slf4j
public class ChangeReceiverController { 
	@Resource
	ReceiverService receiverService;
	
	@RequestMapping("/changeReceiverForm")
	public String changeReceiverForm (Model model, HttpSession session) {
		Customer customer = (Customer)session.getAttribute("customerLogin");
		List<Receiver> receiverList = receiverService.getListByCustomerId(customer.getCustomerId());
		model.addAttribute("receiverList", receiverList);
		
		return "user/changeReceiverForm";
	}
	
}
