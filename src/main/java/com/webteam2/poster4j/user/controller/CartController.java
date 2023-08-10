package com.webteam2.poster4j.user.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webteam2.poster4j.dto.Cart;
import com.webteam2.poster4j.dto.Customer;
import com.webteam2.poster4j.dto.Product;
import com.webteam2.poster4j.dto.ProductImage;
import com.webteam2.poster4j.service.CartService;
import com.webteam2.poster4j.service.ProductImageService;
import com.webteam2.poster4j.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CartController {
	@Resource
	ProductImageService productImageService;
	@Resource
	ProductService productService;
	@Resource
	CartService cartService;

	@RequestMapping("/cart")
	public String search(HttpSession session, Model model) {
		/*
		 * newOrderItemList를 cart 테이블에 넣고, cart 테이블에서 정보를 받아와 model에 저장
		 * 
		 * 필요 데이터:
		 * 상품 대표 이미지
		 * 상품명
		 * 상품 가격
		 * 상품 할인율
		 * 상품 옵션, 상품 수량
		 * => product, productImage(Represent), orderItemList 사용
		 */
		Customer customer = (Customer)session.getAttribute("customerLogin");
		List<Cart> cartItemList = cartService.getItemsByCustomerId(customer.getCustomerId());
		List<Product> productList = new ArrayList<>();
		List<String> imageList = new ArrayList<String>();
		for (Cart cartItem : cartItemList) {
			int productId = cartItem.getProductId();
			productList.add(productService.getOneProduct(productId));
			
			ProductImage productImage = productImageService.getRepresentProductImage(productId);
			String base64Img = Base64.getEncoder().encodeToString(productImage.getProductImageSource());
			imageList.add(base64Img);
		}
		model.addAttribute("cartItemList", cartItemList);
		model.addAttribute("productList", productList);
		model.addAttribute("imageList", imageList);
		
		
		return "user/cart";
	}
	
	@RequestMapping("/cartPlusQuantity")
	@ResponseBody
	public String cartPlusQuantity(@RequestParam String customerId, 
									 @RequestParam int productId,
									 @RequestParam String optionSize,
									 @RequestParam String optionFrame) {
		cartService.plusQuantity(customerId, productId, optionSize, optionFrame);
		
		return "success";
	}
	
	@RequestMapping("/cartMinusQuantity")
	@ResponseBody
	public String cartMinusQuantity(@RequestParam String customerId, 
									 @RequestParam int productId,
									 @RequestParam String optionSize,
									 @RequestParam String optionFrame) {
		cartService.minusQuantity(customerId, productId, optionSize, optionFrame);
		
		return "success";
	}
}
