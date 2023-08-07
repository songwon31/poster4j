package com.webteam2.poster4j.admin.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webteam2.poster4j.service.OrderCancelService;
import com.webteam2.poster4j.service.OrderDetailService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminCancelOrderController { 
	@Resource
	OrderDetailService orderDetailService;
	@Resource
	OrderCancelService orderCancelSerivce;
	
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
			@RequestParam(value="cancelReason", required=false) String cancelReason) 
	{
		
		return null;
	}
	
	
}
