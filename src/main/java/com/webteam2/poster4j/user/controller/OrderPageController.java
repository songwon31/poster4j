package com.webteam2.poster4j.user.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam2.poster4j.dto.Customer;
import com.webteam2.poster4j.dto.Product;
import com.webteam2.poster4j.dto.ProductImage;
import com.webteam2.poster4j.dto.Receiver;
import com.webteam2.poster4j.service.ProductImageService;
import com.webteam2.poster4j.service.ProductService;
import com.webteam2.poster4j.service.ReceiverService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OrderPageController {
	@Resource
	ReceiverService receiverService;
	@Resource
	ProductImageService productImageService;
	@Resource
	ProductService productService;
	
	
	@RequestMapping("/order")
	public String order(HttpSession session, Model model, Product product ) {
		//세션에 저장된 customer 정보
		Customer customer = (Customer)session.getAttribute("customerLogin");
		if (customer == null) {
			// 로그인 정보가 없으면 로그인 페이지로 이동하거나 필요한 처리를 수행
			return "redirect:/login"; // 로그인 페이지로 리다이렉트
		}
		log.info("주문페이지 실행");
		
		Receiver defaultReceiver = receiverService.getDefaultReceiver(customer.getCustomerId());
		
		
		List<Receiver> list = receiverService.getListByCustomerId(customer.getCustomerId());		
		
		model.addAttribute("defaultReceiver", defaultReceiver);
		model.addAttribute("receivers", list);
		
		//넘겨받은 product id를 리스트로 저장
		List<Integer> productIds = Arrays.asList(1, 2, 3);
		
		//List<ProductImage> productImages = productImageService.getOrderProductImageList(product.getProductId());
		List<String> convertedImages = new ArrayList<String>();
		List<Product> productList = new ArrayList<Product>();
		
		for (Integer productId : productIds) {
			List<ProductImage> productImages = productImageService.getOrderProductImageList(productId);
			for (ProductImage image : productImages) {
				String base64Img = Base64.getEncoder().encodeToString(image.getProductImageSource());
				//image.setBase64Data(base64Img);
				
				convertedImages.add(base64Img);
				product = productService.getOneProduct(image.getProductId());
				productList.add(product);
				
			}
		}
		
		
		model.addAttribute("convertedImages", convertedImages);
		model.addAttribute("productList", productList);
		
		return "user/orderForm";
		
		
	}
}
