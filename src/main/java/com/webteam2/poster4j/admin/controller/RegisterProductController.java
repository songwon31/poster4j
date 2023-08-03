package com.webteam2.poster4j.admin.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam2.poster4j.dto.Product;
import com.webteam2.poster4j.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class RegisterProductController { 
	@Resource
	ProductService productService;
	
	@RequestMapping("/registerProductForm")
	public String registerProductForm () {
		
		return "admin/registerProduct";
	}
	
	@RequestMapping("/register") 
	public String register() {
		Product product = new Product();
		product.setProductId(27);
		product.setProductName("poster27");
		product.setProductPrice(10000);
		product.setProductDiscountRate(0);
		product.setProductTheme("wave");
		product.setProductArtist("songwon");
		product.setProductTexture("normal");
		
		productService.registerProduct(product);
		
		
		
		
		return "redirect:/admin/productBoard";
	}
	
}
