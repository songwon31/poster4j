package com.webteam2.poster4j.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class JoinPageController {
	@RequestMapping("/join")
	public String join() {
		log.info("실행777");
		return "user/joinForm";
	}
}