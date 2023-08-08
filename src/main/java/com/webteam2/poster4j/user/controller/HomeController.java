package com.webteam2.poster4j.user.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam2.poster4j.dto.Product;
import com.webteam2.poster4j.dto.ProductImage;
import com.webteam2.poster4j.service.ProductImageService;
import com.webteam2.poster4j.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	@Resource
	ProductService productService;
	@Resource
	ProductImageService productImageService;

	@RequestMapping("/")
	public String home() {
		log.info("home 실행");
		return "user/home";
	}

	@GetMapping("/")
	public String getPosterImage(Model model) {
		
		List<ProductImage> productImages = productImageService.getList();
		List<String> convertedImages = new ArrayList<String>();
		List<Product> productList = new ArrayList<Product>();
		for (ProductImage image : productImages) {
			String base64Img = Base64.getEncoder().encodeToString(image.getProductImageSource());
			//image.setBase64Data(base64Img);
			
			convertedImages.add(base64Img);
			
			Product product = productService.getOneProduct(image.getProductId());
			productList.add(product);
		}
		
		model.addAttribute("convertedImages", convertedImages);
		model.addAttribute("productList", productList);
		
		
		return "user/home";
		
	}
}
