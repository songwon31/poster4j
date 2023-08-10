package com.webteam2.poster4j.user.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.webteam2.poster4j.dto.Customer;
import com.webteam2.poster4j.dto.OrderItem;
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

	@GetMapping("/cart")
	public String search(List<OrderItem> newOrderItemList, HttpSession session, Model model) {
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
		
		
		
		
		return "user/cart";
	}
}
