package com.webteam2.poster4j.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	@RequestMapping("/")
	public String home() {
		log.info("실행5727");
		return "home";
	}
}
