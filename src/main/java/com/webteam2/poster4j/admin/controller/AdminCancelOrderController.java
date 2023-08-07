package com.webteam2.poster4j.admin.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webteam2.poster4j.dto.OrderCancel;
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
		orderDetailService.changeOrderDetailStatus(orderId, productId, "취소됨");
		
		OrderCancel orderCancel = new OrderCancel();
		orderCancel.setOrderId(orderId);
		orderCancel.setProductId(productId);
		orderCancel.setOrderCancelCategory(cancelCategory);
		if (cancelReason != null && !cancelReason.equals("")) {
			orderCancel.setOrderCancelReason(cancelReason);
		}
		orderCancel.setOrderCancelReqDate(new Date());
		orderCancelSerivce.cancelOrder(orderCancel);
		
		return "redirect:/admin/adminCancelOrderForm?orderId=-1&productId=-1";
	}
	
	
}
