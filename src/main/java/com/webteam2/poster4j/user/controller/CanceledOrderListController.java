package com.webteam2.poster4j.user.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam2.poster4j.dto.CanceledOrder;
import com.webteam2.poster4j.dto.Customer;
import com.webteam2.poster4j.dto.OrderDetail;
import com.webteam2.poster4j.dto.OrderT;
import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.dto.Product;
import com.webteam2.poster4j.dto.ProductImage;
import com.webteam2.poster4j.service.CanceledOrderService;
import com.webteam2.poster4j.service.OrderDetailService;
import com.webteam2.poster4j.service.OrderTService;
import com.webteam2.poster4j.service.ProductImageService;
import com.webteam2.poster4j.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CanceledOrderListController {
	@Resource
	CanceledOrderService canceledOrderService;
	@Resource
	OrderTService orderService;
	@Resource
	OrderDetailService orderDetailService;
	@Resource
	ProductService productService;
	@Resource
	ProductImageService productImageService;
	
	@RequestMapping("/canceledOrderList")
	public String getCanceledOrderList(HttpSession session, Model model, String pageNo) {
		
		Customer customer = (Customer)session.getAttribute("customerLogin");
		if (customer == null) {
			// 로그인 정보가 없으면 로그인 페이지로 이동하거나 필요한 처리를 수행
			return "redirect:/login"; // 로그인 페이지로 리다이렉트
		}
		
		// 브라우저에서 pageNo가 넘어오지 않았을 경우
		if (pageNo == null) {
			// 세션에 저장되어 있는지 확인
			pageNo = (String) session.getAttribute("pageNo");
			if (pageNo == null) {
				// 저장되어 있지 않다면 "1"로 초기화
				pageNo = "1";
			}
		}
		// 문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageNo);
		// 세션에 PageNo를 저장
		session.setAttribute("pageNo", String.valueOf(pageNo));
		
		int totalOrderNum = orderService.getTotalOrderTNumByCustomerId(customer.getCustomerId());
		Pager pager = new Pager(5, 5, totalOrderNum, intPageNo);
		
		List<OrderT> orderList = orderService.getOrderListById(customer.getCustomerId());
		List<CanceledOrder> canceledOrderList  = new ArrayList<>();
		List<OrderDetail> orderDetailList = new ArrayList<>();
		List<Product> productList = new ArrayList<>();
		List<String> productImageList = new ArrayList<>();
		
		for(OrderT order : orderList) {
			int orderId = order.getOrderId();
			List<CanceledOrder> canceledOrdersForOrder = canceledOrderService.getListWithPagerAndId(pager, orderId);
			List<OrderDetail> orderDetailsForOrder = orderDetailService.getListNoPager(orderId);
			for(OrderDetail orderDetail : orderDetailsForOrder) {
				int productId = orderDetail.getProductId();
				Product product = productService.getOneProduct(productId);
				ProductImage productImage = productImageService.getRepresentProductImage(productId);
				String base64Img = Base64.getEncoder().encodeToString(productImage.getProductImageSource());
				
				productList.add(product);
				productImageList.add(base64Img);
			}
			
			canceledOrderList.addAll(canceledOrdersForOrder);
			orderDetailList.addAll(orderDetailsForOrder);
		}
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		
		for(OrderT order : orderList) {
			Date orderDate = order.getOrderDate();
			String formattedOrderDate = dateFormat.format(orderDate);
			order.setConvertedOrderDate(formattedOrderDate);
		}
		
		for(CanceledOrder canceledOrder : canceledOrderList) {
			Date canceledOrderReqDate = canceledOrder.getCanceledOrderReqDate();
			String formattedDate = dateFormat.format(canceledOrderReqDate);
			canceledOrder.setFormattedCanceledOrderReqDate(formattedDate);
			
		}
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("canceledOrderList", canceledOrderList);
		model.addAttribute("orderDetailList", orderDetailList);
		model.addAttribute("productList", productList);
		model.addAttribute("productImageList", productImageList);
		model.addAttribute("pager", pager);
		return "/user/canceledOrderList";
	}
}
