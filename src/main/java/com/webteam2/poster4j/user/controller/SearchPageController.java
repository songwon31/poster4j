package com.webteam2.poster4j.user.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.webteam2.poster4j.dto.Product;
import com.webteam2.poster4j.dto.ProductImage;
import com.webteam2.poster4j.service.ProductImageService;
import com.webteam2.poster4j.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SearchPageController {
	@Resource
	ProductImageService productImageService;
	@Resource
	ProductService productService;
	
	@GetMapping("/search")
	public String search(Model model) {
		List<Integer> productIds = productService.getAllProductId();
		
		List<String> convertedImages = new ArrayList<String>();
		for (Integer productId : productIds) {
			List<ProductImage> productImages = productImageService.getOrderProductImageList(productId);
			for (ProductImage image : productImages) {
				String base64Img = Base64.getEncoder().encodeToString(image.getProductImageSource());
				//image.setBase64Data(base64Img);
				convertedImages.add(base64Img);
			}
		}
		model.addAttribute("convertedImages", convertedImages);
		
		
		return "user/searchPage";
	}
}
