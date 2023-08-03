package com.webteam2.poster4j.user.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam2.poster4j.user.service.ProductImageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	@Resource
	ProductImageService productImageService;
	
	@RequestMapping("/")
	public String home() {
		log.info("home 실행");
		return "user/home";
	}
	
	@GetMapping("/")
	public String getPosterImage(HttpSession session) {
		String productImageSrcRoute = productImageService.getSrcRoute(1);
		session.setAttribute("productRoute", productImageSrcRoute);
		return "user/home";
	}
}
