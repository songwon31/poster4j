package com.webteam2.poster4j.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class OrderBoardController {
	@RequestMapping("/orderBoard")
	public String home() {
		return "admin/orderBoard";
	}
}
