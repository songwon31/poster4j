package com.webteam2.poster4j.admin.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam2.poster4j.dto.OrderInquiryAnswer;
import com.webteam2.poster4j.service.OrderInquiryAnswerService;
import com.webteam2.poster4j.service.OrderInquiryService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class OrderInquiryAnswerController { 
	@Resource
	OrderInquiryService orderInquiryService;
	@Resource
	OrderInquiryAnswerService orderInquiryAnswerService;
	
	@RequestMapping("/orderInquiryAnswerForm")
	public String orderInquiryAnswerForm (int orderInquiryId, String orderInquiryContent, Model model) {
		model.addAttribute("orderInquiryId", orderInquiryId);
		model.addAttribute("orderInquiryContent", orderInquiryContent);
		return "admin/orderInquiryAnswer";
	}
	
	@RequestMapping("/orderInquiryAnswer")
	public String orderInquiryAnswer(int orderInquiryId, String answer) {
		OrderInquiryAnswer orderInquiryAnswer = new OrderInquiryAnswer();
		orderInquiryAnswer.setOrderInquiryId(orderInquiryId);
		orderInquiryAnswer.setOrderInquiryAnsContent(answer);
		orderInquiryAnswer.setOrderInquiryAnsDate(new Date());
		orderInquiryAnswerService.registerAnswer(orderInquiryAnswer);
		
		orderInquiryService.setAnsweredTrue(orderInquiryId);
		
		return "redirect:/admin/orderInquiryAnswerForm?orderInquiryId=-1";
	}
	
}
