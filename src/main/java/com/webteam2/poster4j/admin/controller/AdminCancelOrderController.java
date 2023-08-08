package com.webteam2.poster4j.admin.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webteam2.poster4j.dto.CanceledOrder;
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
		
		CanceledOrder canceledOrder = new CanceledOrder();
		canceledOrder.setOrderId(orderId);
		canceledOrder.setProductId(productId);
		canceledOrder.setCanceledOrderCategory(cancelCategory);
		log.info("cancelReason: " + cancelReason);
		if (cancelReason != null && !cancelReason.equals("")) {
			canceledOrder.setCanceledOrderReason(cancelReason);
		}
		canceledOrder.setCanceledOrderReqDate(new Date());
		canceledOrderService.cancelOrder(canceledOrder);
		
		return "redirect:/admin/adminCancelOrderForm?orderId=-1&productId=-1";
	}
	
	
}
