package com.webteam2.poster4j.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.webteam2.poster4j.dto.Product;
import com.webteam2.poster4j.dto.ProductImage;
import com.webteam2.poster4j.service.ProductImageService;
import com.webteam2.poster4j.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminCancelOrderController { 
	@Resource
	ProductService productService;
	@Resource
	ProductImageService productImageService;
	
	@RequestMapping("/adminCancelOrderForm")
	public String updateProductForm (int orderId, int productId, Model model) {
		model.addAttribute("orderId", orderId);
		model.addAttribute("productId", productId);
		return "admin/cancelOrder";
	}
	
	@PostMapping("/cancelOrder")
	public String cancelOrder(
			@RequestParam("orderId") int orderId,
			@RequestParam("productId") int productId,
			@RequestParam("cancelCategory") String cancelCategory,
			@RequestParam("cancelReason") String cancelReason) {
		
		return null;
	}
	
	
}
