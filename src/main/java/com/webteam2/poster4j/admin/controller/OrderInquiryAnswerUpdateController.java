package com.webteam2.poster4j.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class OrderInquiryAnswerUpdateController { 
	
	@RequestMapping("/orderInquiryAnswerUpdateForm")
	public String orderInquiryAnswerForm (int orderInquiryId, Model model) {
		model.addAttribute("orderInquiryId", orderInquiryId);
		log.info("1");
		return "admin/orderInquiryAnswerUpdate";
	}
	
}
