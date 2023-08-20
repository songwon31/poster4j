package com.webteam2.poster4j.admin.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam2.poster4j.dto.OrderInquiryAnswer;
import com.webteam2.poster4j.dto.ProductInquiryAnswer;
import com.webteam2.poster4j.interceptor.Auth;
import com.webteam2.poster4j.interceptor.Auth.Role;
import com.webteam2.poster4j.service.ProductInquiryAnswerService;
import com.webteam2.poster4j.service.ProductInquiryService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class ProductInquiryAnswerController { 
	@Resource
	ProductInquiryService productInquiryService;
	@Resource
	ProductInquiryAnswerService productInquiryAnswerService;
	
	@RequestMapping("/productInquiryAnswerForm")
	@Auth(Role.ADMIN)
	public String productInquiryAnswerForm (int productInquiryId, String productInquiryContent, Model model) {
		model.addAttribute("productInquiryId", productInquiryId);
		model.addAttribute("productInquiryContent", productInquiryContent);
		return "admin/productInquiryAnswer";
	}
	
	@RequestMapping("/productInquiryAnswer")
	@Auth(Role.ADMIN)
	public String orderInquiryAnswer(int productInquiryId, String answer) {
		ProductInquiryAnswer productInquiryAnswer = new ProductInquiryAnswer();
		productInquiryAnswer.setProductInquiryId(productInquiryId);
		productInquiryAnswer.setProductInquiryAnswerContent(answer);
		productInquiryAnswer.setProductInquiryAnswerDate(new Date());
		productInquiryAnswerService.registerAnswer(productInquiryAnswer);
		
		productInquiryService.setAnsweredTrue(productInquiryId);
		
		return "redirect:/admin/productInquiryAnswerForm?productInquiryId=-1";
	}
	
}
