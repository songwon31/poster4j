package com.webteam2.poster4j.user.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webteam2.poster4j.dto.Customer;
import com.webteam2.poster4j.dto.OrderDetail;
import com.webteam2.poster4j.dto.OrderItem;
import com.webteam2.poster4j.dto.OrderT;
import com.webteam2.poster4j.dto.Product;
import com.webteam2.poster4j.dto.ProductImage;
import com.webteam2.poster4j.dto.Receiver;
import com.webteam2.poster4j.service.CartService;
import com.webteam2.poster4j.service.OrderDetailService;
import com.webteam2.poster4j.service.OrderTService;
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
	@Resource
	OrderTService orderService;
	@Resource
	OrderDetailService orderDetailService;
	@Resource
	CartService cartService;

	@RequestMapping("/order")
	public String order(HttpSession session, Model model, OrderItem orderItem) {
		// 세션에 저장된 customer 정보
		Customer customer = (Customer) session.getAttribute("customerLogin");
		if (customer == null) {
			// 로그인 정보가 없으면 로그인 페이지로 이동하거나 필요한 처리를 수행
			return "redirect:/login"; // 로그인 페이지로 리다이렉트
		}
		log.info("주문페이지 실행");
		
		Receiver defaultReceiver = receiverService.getDefaultReceiver(customer.getCustomerId());
		
		List<Receiver> list = receiverService.getListByCustomerId(customer.getCustomerId());
		
		
		model.addAttribute("defaultReceiver", defaultReceiver);
		model.addAttribute("receivers", list);

		List<String> convertedImages = new ArrayList<String>();
		List<Product> products = new ArrayList<Product>();

		// 현재는 OrderItem List 객체를 직접 생성했지만, 데이터를 넘겨 받게되면 바꿀 것임.
		/*
		 * List<OrderItem> orderItems = new ArrayList<OrderItem>();
		 * 
		 * OrderItem item1 = new OrderItem(1, "cheolkim", 1, "a3(297*420mm)", "black");
		 * OrderItem item2 = new OrderItem(2, "cheolkim", 2, "a2(420*594mm)", "silver");
		 * 
		 * orderItems.add(item1); orderItems.add(item2);
		 */

		
		
		for (OrderItem item : orderItem.getOrderItemList()) {
			int productId = item.getProductId();
			ProductImage productImage = productImageService.getImage(productId);
			String convertedImage = Base64.getEncoder().encodeToString(productImage.getProductImageSource());
			convertedImages.add(convertedImage);

			Product orderProduct = productService.getOneProduct(productId);
			orderProduct.setProductPrice(orderProduct.getProductPrice() * item.getProductQuantity());
			products.add(orderProduct);

		}

		model.addAttribute("orderItemList", orderItem.getOrderItemList());
		model.addAttribute("productList", products);
		model.addAttribute("orderProductImageList", convertedImages);

		return "user/orderForm";

	}
	
	@PostMapping("/getNewReceiver")
	@ResponseBody
	public Map<String, String> getNewReceiver(@RequestParam int receiverId) {
		Receiver receiver  = receiverService.getBoard(receiverId);
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("receiverId", Integer.toString(receiver.getReceiverId()));
		map.put("receiverName", receiver.getReceiverName());
		map.put("receiverZip", receiver.getReceiverZip());
		map.put("receiverAddress", receiver.getReceiverAddress());
		map.put("receiverAddressDetail", receiver.getReceiverAddressDetail());
		map.put("receiverTelno", receiver.getReceiverTelno());
		map.put("receiverAddressType", receiver.getReceiverAddressType());
		map.put("receiverEnabled", receiver.getReceiverEnabled());
		map.put("receiverPersonName", receiver.getReceiverPersonName());
		
		return map;
	}

	@PostMapping("/postOrder")
	public String postOrder(HttpSession session, OrderT order, 
			@RequestParam("productId") String[] productIds,
			@RequestParam("optionSize") String[] optionSizes,
			@RequestParam("orderDetailQuantity") String[] orderDetailQuantity,
			@RequestParam("optionFrame") String[] optionFrames,
			@RequestParam("orderDetailPrice") int[] orderDetailPrice,
			@RequestParam(value="orderDeliveryDemandInput", required=false) String orderDeliveryDemandInput) {
		// 세션에 저장된 customer 정보
		Customer customer = (Customer) session.getAttribute("customerLogin");
		if (customer == null) {
			// 로그인 정보가 없으면 로그인 페이지로 이동하거나 필요한 처리를 수행
			return "redirect:/login"; // 로그인 페이지로 리다이렉트
		}

		Date orderDate = new Date();
		order.setCustomerId(customer.getCustomerId());
		order.setOrderDate(orderDate);
		
		if (order.getOrderDeliveryDemand().equals("직접 입력")) {
			order.setOrderDeliveryDemand(orderDeliveryDemandInput);
		}

		orderService.saveOrder(order);

		for (int i = 0; i < productIds.length; i++) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrderId(order.getOrderId());
			orderDetail.setProductId(Integer.parseInt(productIds[i]));
			orderDetail.setOptionSize(optionSizes[i]);
			orderDetail.setOptionFrame(optionFrames[i]);
			orderDetail.setOrderDetailQuantity(Integer.parseInt(orderDetailQuantity[i]));
			orderDetail.setOrderDetailPrice(orderDetailPrice[i]);

			log.info("orderDetail:" + orderDetail);
			orderDetailService.saveOrderDetail((orderDetail));
			
			// 주문이 완료되면 상품 삭제
			cartService.removeItem(order.getCustomerId(), orderDetail.getProductId(), orderDetail.getOptionSize(), orderDetail.getOptionFrame());
		}
		
		return "redirect:/cart";
	}
}
