package com.webteam2.poster4j.admin.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webteam2.poster4j.dto.CanceledOrder;
import com.webteam2.poster4j.interceptor.Auth;
import com.webteam2.poster4j.interceptor.Auth.Role;
import com.webteam2.poster4j.service.CanceledOrderService;
import com.webteam2.poster4j.service.OrderDetailService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminCancelOrderController { 
	@Resource
	OrderDetailService orderDetailService;
	@Resource
	CanceledOrderService canceledOrderService;
	
	@RequestMapping("/adminCancelOrderForm")
	@Auth(Role.ADMIN)
	public String adminCancelOrderForm (int orderId, int productId, 
			@RequestParam(value="optionSize", required=false)String optionSize, 
			@RequestParam(value="optionFrame", required=false)String optionFrame, Model model) {
		model.addAttribute("orderId", orderId);
		model.addAttribute("productId", productId);
		model.addAttribute("optionSize", optionSize);
		model.addAttribute("optionFrame", optionFrame);
		return "admin/cancelOrder";
	}
	
	@PostMapping("/cancelOrder")
	@Auth(Role.ADMIN)
	public String cancelOrder(
			@RequestParam("orderId") int orderId,
			@RequestParam("productId") int
			productId,
			@RequestParam(value="optionSize", required=false)String optionSize, 
			@RequestParam(value="optionFrame", required=false)String optionFrame,
			@RequestParam("cancelCategory") String cancelCategory,
			@RequestParam(value="cancelReason", required=false) String cancelReason) 
	{
		orderDetailService.changeOrderDetailStatus(orderId, productId, optionSize, optionFrame, "취소됨");
		
		CanceledOrder canceledOrder = new CanceledOrder();
		canceledOrder.setOrderId(orderId);
		canceledOrder.setProductId(productId);
		canceledOrder.setOptionSize(optionSize);
		canceledOrder.setOptionFrame(optionFrame);
		canceledOrder.setCanceledOrderCategory(cancelCategory);
		if (cancelReason != null && !cancelReason.equals("")) {
			canceledOrder.setCanceledOrderReason(cancelReason);
		}
		canceledOrder.setCanceledOrderReqDate(new Date());
		canceledOrderService.cancelOrder(canceledOrder);
		
		return "redirect:/admin/adminCancelOrderForm?orderId=-1&productId=-1";
	}
	
	
}
