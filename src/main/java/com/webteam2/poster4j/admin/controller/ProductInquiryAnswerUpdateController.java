package com.webteam2.poster4j.admin.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam2.poster4j.dto.ProductInquiryAnswer;
import com.webteam2.poster4j.interceptor.Auth;
import com.webteam2.poster4j.interceptor.Auth.Role;
import com.webteam2.poster4j.service.ProductInquiryAnswerService;
import com.webteam2.poster4j.service.ProductInquiryService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class ProductInquiryAnswerUpdateController { 
	@Resource
	ProductInquiryService productInquiryService;
	@Resource
	ProductInquiryAnswerService productInquiryAnswerService;
	
	@RequestMapping("/productInquiryAnswerUpdateForm")
	@Auth(Role.ADMIN)
	public String productInquiryAnswerUpdateForm (int productInquiryId, String productInquiryContent, Model model) {
		model.addAttribute("productInquiryId", productInquiryId);
		model.addAttribute("productInquiryContent", productInquiryContent);
		String originalAnswer = productInquiryAnswerService.getAnswerById(productInquiryId);
		model.addAttribute("originalAnswer", originalAnswer);
		
		return "admin/productInquiryAnswerUpdate";
	}
	
	@PostMapping("/productInquiryAnswerUpdate")
	@Auth(Role.ADMIN)
	public String productInquiryAnswerUpdate (ProductInquiryAnswer productInquiryAnswer) {
		productInquiryAnswer.setProductInquiryAnswerDate(new Date());
		productInquiryAnswerService.editAnswer(productInquiryAnswer);
		
		return "redirect:/admin/productInquiryAnswerUpdateForm?productInquiryId=-1";
	}
	
}
