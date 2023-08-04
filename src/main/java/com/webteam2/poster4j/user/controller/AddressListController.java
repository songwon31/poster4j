package com.webteam2.poster4j.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AddressListController {
	@RequestMapping("/addressList")
	public String AddressListController() {
		log.info("배송지 리스트 실행");
		return "user/addressList";
	}
}
