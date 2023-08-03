package com.webteam2.poster4j.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam2.poster4j.dto.Product;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class RegisterProductController {
	@RequestMapping("/registerProductForm")
	public String registerProductForm () {
		
		return "admin/registerProduct";
	}
	
	@RequestMapping("/register") 
	public String register() {
		Product product = new Product();
		product.setProductId(25);
		product.setProductName("poster25");
		product.setProductPrice(10000);
		product.setProductDiscountRate(0);
		product.setProductTheme("wave");
		product.setProductArtist("songwon");
		product.setProductTexture("normal");
		
		return "redirect:/admin/productBoard";
	}
	
}
