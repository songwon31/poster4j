package com.webteam2.poster4j.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class ProductBoardController {
	@RequestMapping("/productBoard")
	public String orderBoard() {
	
		return "admin/productBoard";
	}
}
