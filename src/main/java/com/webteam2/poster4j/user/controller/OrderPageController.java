package com.webteam2.poster4j.user.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam2.poster4j.dto.Customer;
import com.webteam2.poster4j.dto.OrderItem;
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
	public String order(HttpSession session, Model model) {
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
		
		
		
		List<String> convertedImages = new ArrayList<String>();
		List<Product> products = new ArrayList<Product>();
		
		//현재는 OrderItem List 객체를 직접 생성했지만, 데이터를 넘겨 받게되면 바꿀 것임.
		List<OrderItem> orderItems = new ArrayList<OrderItem>();
		
	    OrderItem item1 = new OrderItem(1,"cheolkim", 1, "500*300", "black");
	    OrderItem item2 = new OrderItem(1,"cheolkim", 2, "5000*300", "black");
	    
	    orderItems.add(item1);
	    orderItems.add(item2);
		
		
		for (OrderItem item : orderItems) {
			int productId = item.getProductId();
			ProductImage productImage = productImageService.getImage(productId);
			String convertedImage = Base64.getEncoder().encodeToString(productImage.getProductImageSource());
			convertedImages.add(convertedImage);
			
			
			Product orderProduct = productService.getOneProduct(productId);
			log.info("" + orderProduct.getProductPrice());
			log.info("" + orderProduct.getProductPrice() * item.getProductQuantity());
			orderProduct.setProductPrice(orderProduct.getProductPrice() * item.getProductQuantity());  
			products.add(orderProduct);
			
		}
		
		model.addAttribute("OrderItemList", orderItems);
		model.addAttribute("productList", products);
		model.addAttribute("orderProductImageList", convertedImages);
		
		
		
		return "user/orderForm";
		
		
	}
}
