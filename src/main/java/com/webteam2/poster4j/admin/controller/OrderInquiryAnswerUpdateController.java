package com.webteam2.poster4j.admin.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam2.poster4j.dto.OrderInquiryAnswer;
import com.webteam2.poster4j.service.OrderInquiryAnswerService;
import com.webteam2.poster4j.service.OrderInquiryService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class OrderInquiryAnswerUpdateController { 
	@Resource
	OrderInquiryService orderInquiryService;
	@Resource
	OrderInquiryAnswerService orderInquiryAnswerService;
	
	@RequestMapping("/orderInquiryAnswerUpdateForm")
	public String orderInquiryAnswerForm (int orderInquiryId, String orderInquiryContent, Model model) {
		model.addAttribute("orderInquiryId", orderInquiryId);
		model.addAttribute("orderInquiryContent", orderInquiryContent);
		String originalAnswer = orderInquiryAnswerService.getAnswerById(orderInquiryId);
		model.addAttribute("originalAnswer", originalAnswer);
		
		return "admin/orderInquiryAnswerUpdate";
	}
	
	@PostMapping("/orderInquiryAnswerUpdate")
	public String orderInquiryAnswerUpdate (OrderInquiryAnswer orderInquiryAnswer) {
		orderInquiryAnswer.setOrderInquiryAnsDate(new Date());
		orderInquiryAnswerService.editAnswer(orderInquiryAnswer);
		
		return "redirect:/admin/orderInquiryAnswerUpdateForm?orderInquiryId=-1";
	}
	
}
