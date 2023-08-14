package com.webteam2.poster4j.user.controller;

import org.springframework.stereotype.Controller;	
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class OrderListController {
	
	@RequestMapping("/orderList")
	public String getOrderList() {
		log.info("orderList 실행");
		return "user/orderList";
	}
}
