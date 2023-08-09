package com.webteam2.poster4j.user.controller;

import java.util.Base64;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webteam2.poster4j.dto.Product;
import com.webteam2.poster4j.dto.ProductImage;
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
	public String productDetail(@RequestParam(defaultValue="1")int productId, Model model) {
		ProductImage productImage = productImageService.getImage(productId);
		Product product = new Product();

		String convertedImage = Base64.getEncoder().encodeToString(productImage.getProductImageSource());
		product = productService.getOneProduct(productImage.getProductId());
		
		model.addAttribute("convertedImage", convertedImage);
		model.addAttribute("product", product);
		
		//할인된 상품가격 계산
		double discountedPrice = product.getProductPrice() * (1.0 - product.getProductDiscountRate());
		double discountAmount = product.getProductPrice() * product.getProductDiscountRate();
		
		model.addAttribute("discountedPrice", discountedPrice);
		model.addAttribute("discountAmount", discountAmount);
		
		return "user/productDetailPage";
	}

}
