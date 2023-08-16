package com.webteam2.poster4j.user.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
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
import com.webteam2.poster4j.dto.OrderItem;
import com.webteam2.poster4j.dto.Product;
import com.webteam2.poster4j.dto.ProductImage;
import com.webteam2.poster4j.interceptor.Login;
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
	@Login
	public String cart(HttpSession session, Model model) {
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
		
		int totalPrice = 0;
		for (int i=0; i<cartItemList.size(); ++i) {
			totalPrice += cartItemList.get(i).getCartProductQuantity() * productList.get(i).getProductPrice() * (1 - productList.get(i).getProductDiscountRate());
		}
		
		DecimalFormat df = new DecimalFormat("###,###,###");
		
		String originalTotalPrice = df.format(totalPrice);
		model.addAttribute("originalTotalPrice", originalTotalPrice);
		
		if (totalPrice >= 50000) {
			model.addAttribute("shippingFee", "무료");
			String finalTotalPrice = df.format(totalPrice);
			model.addAttribute("finalTotalPrice", finalTotalPrice);
		} else {
			model.addAttribute("shippingFee", "3,000");
			String finalTotalPrice = df.format(totalPrice + 3000);
			model.addAttribute("finalTotalPrice", finalTotalPrice);
		}
		
		return "user/cart";
	}
	
	@RequestMapping("/cartChangeQuantity")
	@ResponseBody
	public Map<String, String> cartChangeQuantity(@RequestParam String customerId, 
			 @RequestParam int productId,
			 @RequestParam int cartProductQuantity,
			 @RequestParam String optionSize,
			 @RequestParam String optionFrame) {
		cartService.changeQuantity(customerId, productId, cartProductQuantity, optionSize, optionFrame);

		int productQuantity = cartProductQuantity;
		Product currentProduct = productService.getOneProduct(productId);
		int currentPrice = productQuantity * currentProduct.getProductPrice();
		Double discountPriceD = productQuantity * currentProduct.getProductPrice() * currentProduct.getProductDiscountRate();
		int discountPrice = discountPriceD.intValue();
		int discountedPrice = currentPrice - discountPrice;
		
		List<Cart> cartItemList = cartService.getItemsByCustomerId(customerId);
		List<Product> productList = new ArrayList<>();
		for (Cart cartItem : cartItemList) {
			int currentProductId = cartItem.getProductId();
			productList.add(productService.getOneProduct(currentProductId));
		}
		int totalPrice = 0;
		for (int i=0; i<cartItemList.size(); ++i) {
			totalPrice += cartItemList.get(i).getCartProductQuantity() * productList.get(i).getProductPrice() * (1 - productList.get(i).getProductDiscountRate());
		}
		
		Map<String, String> map = new HashMap<String, String>();
		
		DecimalFormat df = new DecimalFormat("###,###,###,###");
		
		String originalTotalPrice = df.format(totalPrice);
		
		String shippingFee = null;
		String finalTotalPrice = null;
		if (totalPrice >= 50000) {
			shippingFee = "무료";
			finalTotalPrice = df.format(totalPrice);
		} else {
			shippingFee = "3,000";
			finalTotalPrice = df.format(totalPrice + 3000);
		}
		
		map.put("productQuantity", df.format(productQuantity));
		map.put("currentPrice", df.format(currentPrice));
		map.put("discountedPrice", df.format(discountedPrice));
		map.put("originalTotalPrice", originalTotalPrice);
		map.put("shippingFee", shippingFee);
		map.put("finalTotalPrice", finalTotalPrice);
		
		return map;
	}
	
	@RequestMapping("/cartPlusQuantity")
	@ResponseBody
	public Map<String, String> cartPlusQuantity(@RequestParam String customerId, 
									 @RequestParam int productId,
									 @RequestParam int cartProductQuantity,
									 @RequestParam String optionSize,
									 @RequestParam String optionFrame) {

		cartService.plusQuantity(customerId, productId, optionSize, optionFrame);

		int productQuantity = cartProductQuantity + 1;
		Product currentProduct = productService.getOneProduct(productId);
		int currentPrice = productQuantity * currentProduct.getProductPrice();
		Double discountPriceD = productQuantity * currentProduct.getProductPrice() * currentProduct.getProductDiscountRate();
		int discountPrice = discountPriceD.intValue();
		
		List<Cart> cartItemList = cartService.getItemsByCustomerId(customerId);
		List<Product> productList = new ArrayList<>();
		for (Cart cartItem : cartItemList) {
			int currentProductId = cartItem.getProductId();
			productList.add(productService.getOneProduct(currentProductId));
		}
		int totalPrice = 0;
		for (int i=0; i<cartItemList.size(); ++i) {
			totalPrice += cartItemList.get(i).getCartProductQuantity() * productList.get(i).getProductPrice() * (1 - productList.get(i).getProductDiscountRate());
		}
		
		Map<String, String> map = new HashMap<String, String>();
		
		DecimalFormat df = new DecimalFormat("###,###,###,###");
		
		String originalTotalPrice = df.format(totalPrice);
		
		if (totalPrice >= 50000) {
			String shippingFee = "무료";
			String finalTotalPrice = df.format(totalPrice);
		} else {
			String shippingFee = "3,000";
			String finalTotalPrice = df.format(totalPrice + 3000);
		}
		
		return map;
	}
	
	@RequestMapping("/cartMinusQuantity")
	@ResponseBody
	public Map<String, String> cartMinusQuantity(@RequestParam String customerId, 
									 @RequestParam int productId,
									 @RequestParam int cartProductQuantity,
									 @RequestParam String optionSize,
									 @RequestParam String optionFrame) {
		cartService.minusQuantity(customerId, productId, optionSize, optionFrame);

		int productQuantity = cartProductQuantity - 1;
		Product currentProduct = productService.getOneProduct(productId);
		int currentPrice = productQuantity * currentProduct.getProductPrice();
		Double discountPriceD = productQuantity * currentProduct.getProductPrice() * currentProduct.getProductDiscountRate();
		int discountPrice = discountPriceD.intValue();
		
		List<Cart> cartItemList = cartService.getItemsByCustomerId(customerId);
		List<Product> productList = new ArrayList<>();
		for (Cart cartItem : cartItemList) {
			int currentProductId = cartItem.getProductId();
			productList.add(productService.getOneProduct(currentProductId));
		}
		int totalPrice = 0;
		for (int i=0; i<cartItemList.size(); ++i) {
			totalPrice += cartItemList.get(i).getCartProductQuantity() * productList.get(i).getProductPrice() * (1 - productList.get(i).getProductDiscountRate());
		}
		
		Map<String, String> map = new HashMap<String, String>();
		
		DecimalFormat dc = new DecimalFormat("###,###,###,###");
		
		map.put("productQuantity", dc.format(productQuantity));
		map.put("currentPrice", dc.format(currentPrice));
		map.put("discountPrice", dc.format(discountPrice));
		map.put("totalPrice", dc.format(totalPrice));
		
		return map;
	}
	
	@RequestMapping("/removeCartItem")
	@ResponseBody
	public String removeCartItem(@RequestParam String customerId, 
			 						@RequestParam int productId,
			 						@RequestParam String optionSize,
			 						@RequestParam String optionFrame) 
	{
		cartService.removeItem(customerId, productId, optionSize, optionFrame);
		return "success";
	}
	
	@RequestMapping("/getAllCartItems")
	@ResponseBody
	public OrderItem getAllCartItems(HttpSession session) {
		log.info("실행1");
		Customer customer = (Customer)session.getAttribute("customerLogin");
		String customerId = customer.getCustomerId();
		List<Cart> cartItems = cartService.getItemsByCustomerId(customerId);
		OrderItem orderItem = new OrderItem();
		orderItem.setOrderItemList(new ArrayList<OrderItem>());
		for (int i=0; i<cartItems.size(); ++i) {
			OrderItem newOrderItem = new OrderItem();
			newOrderItem.setCustomerId(cartItems.get(i).getCustomerId());
			newOrderItem.setProductId(cartItems.get(i).getProductId());
			newOrderItem.setProductQuantity(cartItems.get(i).getCartProductQuantity());
			newOrderItem.setProductSize(cartItems.get(i).getOptionSize());
			newOrderItem.setProductFrame(cartItems.get(i).getOptionFrame());
			orderItem.getOrderItemList().add(newOrderItem);
		}
		log.info("orderItem: " + orderItem);
		
		return orderItem;
	}
}
