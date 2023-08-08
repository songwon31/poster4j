package com.webteam2.poster4j.user.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.webteam2.poster4j.service.ProductImageService;
import com.webteam2.poster4j.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class productDetailPageController {
	@Resource
	ProductService productService;
	@Resource
	ProductImageService productImageService;
	
	@GetMapping("/productDetail")
	public String productDetailPage(int productId, Model model) {
		productService.getOneProduct(productId);
		
		return "user/productDetailPage";
	}

}
