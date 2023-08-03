package com.webteam2.poster4j.user.controller;

import java.util.Base64;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam2.poster4j.dto.ProductImage;
import com.webteam2.poster4j.service.ProductImageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	@Resource
	ProductImageService productImageService;
	
	@RequestMapping("/")
	public String home() {
		log.info("home 실행");
		return "user/home";
	}
	
	@GetMapping("/")
	public String getPosterImage(Model model) {
		ProductImage productImage = productImageService.getImage(1);
		model.addAttribute("productImage", productImage);

		if (productImage.getProductImageSource() != null) {
			// 0과 1로 구성된 바이너리 데이터를 base64 문자로 변환
			String base64Img = Base64.getEncoder().encodeToString(productImage.getProductImageSource());
			model.addAttribute("base64Img", base64Img);
		}
		return "user/home";
	}
}
