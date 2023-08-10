package com.webteam2.poster4j.user.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.webteam2.poster4j.dto.Customer;
import com.webteam2.poster4j.dto.OrderItem;
import com.webteam2.poster4j.service.ProductImageService;
import com.webteam2.poster4j.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CartRequestController {
	@GetMapping("/cartRequest")
	public String cartRequest() {
		
		return "user/cartRequest";
	}
}
