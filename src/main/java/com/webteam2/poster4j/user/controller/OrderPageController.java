package com.webteam2.poster4j.user.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam2.poster4j.user.service.CustomerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OrderPageController {
	@Resource
	CustomerService customerService;
	
	@RequestMapping("/order")
	public String order() {
		log.info("주문페이지 실행");
		return "user/orderForm";
	}
	
	
}
