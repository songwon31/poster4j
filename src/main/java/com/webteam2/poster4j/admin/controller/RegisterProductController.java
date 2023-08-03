package com.webteam2.poster4j.admin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.webteam2.poster4j.dto.Product;
import com.webteam2.poster4j.dto.ProductImage;
import com.webteam2.poster4j.service.ProductImageService;
import com.webteam2.poster4j.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class RegisterProductController { 
	@Resource
	ProductService productService;
	@Resource
	ProductImageService productImageService;
	
	@RequestMapping("/registerProductForm")
	public String registerProductForm () {
		
		return "admin/registerProduct";
	}
	
	@PostMapping("/register") 
	public String register(ProductImage productImage, HttpSession session) throws Exception {
		/*
		Product newProduct = new Product();
		newProduct.setProductId(27);
		newProduct.setProductName("poster27");
		newProduct.setProductPrice(10000);
		newProduct.setProductDiscountRate(0);
		newProduct.setProductTheme("wave");
		newProduct.setProductArtist("songwon");
		newProduct.setProductTexture("normal");
		
		productService.registerProduct(newProduct);
		*/
		productImage.setProductId(26);
		MultipartFile mf = productImage.getProductImageSource();
		if (!mf.isEmpty()) {
			productImage.setProductImageName(mf.getOriginalFilename());
			productImage.setProductImageType(mf.getContentType());
			productImage.setProductImageSource(mf.getBytes());
		}
		productImageService.register(productImage);
		
		
		
		return "redirect:/admin/productBoard";
	}
	
}
