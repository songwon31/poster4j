package com.webteam2.poster4j.admin.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webteam2.poster4j.dto.OrderCancel;
import com.webteam2.poster4j.service.OrderCancelService;
import com.webteam2.poster4j.service.OrderDetailService;

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
