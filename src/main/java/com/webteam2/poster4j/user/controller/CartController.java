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
		Customer customer = (Customer)session.getAttribute("customerLogin");
		List<Cart> cartItemList = cartService.getItemsByCustomerId(customer.getCustomerId());
		List<Product> productList = new ArrayList<>();
		List<String> imageList = new ArrayList<String>();
		for (int i=0; i<cartItemList.size(); ++i) {
			Cart cartItem = cartItemList.get(i);
			model.addAttribute("checked"+i, cartItem.getCartProductChecked());
			int productId = cartItem.getProductId();
			productList.add(productService.getOneProduct(productId));
			
			ProductImage productImage = productImageService.getRepresentProductImage(productId);
			String base64Img = Base64.getEncoder().encodeToString(productImage.getProductImageSource());
			imageList.add(base64Img);
		}
		model.addAttribute("numberOfItems", cartItemList.size());
		model.addAttribute("cartItemList", cartItemList);
		model.addAttribute("productList", productList);
		model.addAttribute("imageList", imageList);
		
		int totalPrice = 0;
		for (int i=0; i<cartItemList.size(); ++i) {
			if (cartItemList.get(i).getCartProductChecked().equals("TRUE")) {
				totalPrice += cartItemList.get(i).getCartProductQuantity() * productList.get(i).getProductPrice() * (1 - productList.get(i).getProductDiscountRate());
			}
		}
		
		DecimalFormat df = new DecimalFormat("###,###,###");
		
		String originalTotalPrice = df.format(totalPrice);
		model.addAttribute("originalTotalPrice", originalTotalPrice);
		
		if (totalPrice >= 50000) {
			model.addAttribute("shippingFee", "무료");
			String finalTotalPrice = df.format(totalPrice);
			model.addAttribute("finalTotalPrice", finalTotalPrice);
		} else if (totalPrice <= 0) {
			model.addAttribute("shippingFee", "0");
			String finalTotalPrice = df.format(totalPrice + 0);
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
			if (cartItemList.get(i).getCartProductChecked().equals("TRUE")) {
				totalPrice += cartItemList.get(i).getCartProductQuantity() * productList.get(i).getProductPrice() * (1 - productList.get(i).getProductDiscountRate());
			}
		}
		
		Map<String, String> map = new HashMap<String, String>();
		
		DecimalFormat df = new DecimalFormat("###,###,###,###");
		
		String originalTotalPrice = df.format(totalPrice);
		
		String shippingFee = null;
		String finalTotalPrice = null;
		if (totalPrice >= 50000) {
			shippingFee = "무료";
			finalTotalPrice = df.format(totalPrice);
		} else if (totalPrice <= 0) {
			shippingFee = "0";
			finalTotalPrice = df.format(totalPrice + 0);
		} else {
			shippingFee = "3,000";
			finalTotalPrice = df.format(totalPrice + 3000);
		}
		
		map.put("productQuantity", df.format(productQuantity));
		map.put("currentPrice", df.format(currentPrice) + "원");
		map.put("discountedPrice", df.format(discountedPrice) + "원");
		map.put("originalTotalPrice", originalTotalPrice);
		map.put("shippingFee", shippingFee);
		map.put("finalTotalPrice", finalTotalPrice);
		
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
	
	@RequestMapping("/cartRemoveSelected")
	public String cartRemoveSelected(@RequestParam ArrayList<Integer> indexes, HttpSession session) {
		log.info(""+indexes);
		Customer customer = (Customer)session.getAttribute("customerLogin");
		List<Cart> cartItemList = cartService.getItemsByCustomerId(customer.getCustomerId());
		for (int i=0; i<indexes.size(); ++i) {
			cartService.removeItem(cartItemList.get(indexes.get(i)).getCustomerId(), cartItemList.get(indexes.get(i)).getProductId(), 
					cartItemList.get(indexes.get(i)).getOptionSize(), cartItemList.get(indexes.get(i)).getOptionFrame());
		}
		
		return "redirect:/cart";
	}
	
	@RequestMapping("/orderSelectedCartItems")
	@ResponseBody
	public OrderItem orderSelectedCartItems(@RequestParam ArrayList<Integer> selectedIndexes, HttpSession session) {
		Customer customer = (Customer)session.getAttribute("customerLogin");
		String customerId = customer.getCustomerId();
		List<Cart> cartItems = cartService.getItemsByCustomerId(customerId);
		OrderItem orderItem = new OrderItem();
		orderItem.setOrderItemList(new ArrayList<OrderItem>());
		for (int i=0; i<selectedIndexes.size(); ++i) {
			OrderItem newOrderItem = new OrderItem();
			newOrderItem.setCustomerId(cartItems.get(selectedIndexes.get(i)).getCustomerId());
			newOrderItem.setProductId(cartItems.get(selectedIndexes.get(i)).getProductId());
			newOrderItem.setProductQuantity(cartItems.get(selectedIndexes.get(i)).getCartProductQuantity());
			newOrderItem.setProductSize(cartItems.get(selectedIndexes.get(i)).getOptionSize());
			newOrderItem.setProductFrame(cartItems.get(selectedIndexes.get(i)).getOptionFrame());
			orderItem.getOrderItemList().add(newOrderItem);
		}
		log.info("orderItem: " + orderItem);
		
		return orderItem;
	}
	
	@RequestMapping("/check")
	@ResponseBody
	public Map<String, String> check(@RequestParam("index") int index, HttpSession session) {
		Customer customer = (Customer)session.getAttribute("customerLogin");
		List<Cart> cartItemList = cartService.getItemsByCustomerId(customer.getCustomerId());
		List<Product> productList = new ArrayList<>();
		
		if (cartItemList.get(index).getCartProductChecked().equals("FALSE")) {
			cartService.toggleCheckedToTrue(cartItemList.get(index));
			cartItemList.get(index).setCartProductChecked("TRUE");
		}
		
		for (Cart cartItem : cartItemList) {
			int currentProductId = cartItem.getProductId();
			productList.add(productService.getOneProduct(currentProductId));
		}
		
		int totalPrice = 0;
		for (int i=0; i<cartItemList.size(); ++i) {
			if (cartItemList.get(i).getCartProductChecked().equals("TRUE")) {
				totalPrice += cartItemList.get(i).getCartProductQuantity() * productList.get(i).getProductPrice() * (1 - productList.get(i).getProductDiscountRate());
		
			}
		}
		
		Map<String, String> map = new HashMap<String, String>();
		
		DecimalFormat df = new DecimalFormat("###,###,###,###");
		
		String originalTotalPrice = df.format(totalPrice);
		
		String shippingFee = null;
		String finalTotalPrice = null;
		if (totalPrice >= 50000) {
			shippingFee = "무료";
			finalTotalPrice = df.format(totalPrice);
		} else if (totalPrice <= 0) {
			shippingFee = "0";
			finalTotalPrice = df.format(totalPrice + 0);
		} else {
			shippingFee = "3,000";
			finalTotalPrice = df.format(totalPrice + 3000);
		}
		
		map.put("originalTotalPrice", originalTotalPrice);
		map.put("shippingFee", shippingFee);
		map.put("finalTotalPrice", finalTotalPrice);
		
		return map;
	}
	
	@RequestMapping("/uncheck")
	@ResponseBody
	public Map<String, String> uncheck(@RequestParam("index") int index, HttpSession session) {
		Customer customer = (Customer)session.getAttribute("customerLogin");
		List<Cart> cartItemList = cartService.getItemsByCustomerId(customer.getCustomerId());
		List<Product> productList = new ArrayList<>();
		
		if (cartItemList.get(index).getCartProductChecked().equals("TRUE")) {
			cartService.toggleCheckedToFalse(cartItemList.get(index));
			cartItemList.get(index).setCartProductChecked("FALSE");
		}
		
		for (Cart cartItem : cartItemList) {
			int currentProductId = cartItem.getProductId();
			productList.add(productService.getOneProduct(currentProductId));
		}
		
		int totalPrice = 0;
		for (int i=0; i<cartItemList.size(); ++i) {
			if (cartItemList.get(i).getCartProductChecked().equals("TRUE")) {
				totalPrice += cartItemList.get(i).getCartProductQuantity() * productList.get(i).getProductPrice() * (1 - productList.get(i).getProductDiscountRate());
		
			}
		}
		
		Map<String, String> map = new HashMap<String, String>();
		
		DecimalFormat df = new DecimalFormat("###,###,###,###");
		
		String originalTotalPrice = df.format(totalPrice);
		
		String shippingFee = null;
		String finalTotalPrice = null;
		if (totalPrice >= 50000) {
			shippingFee = "무료";
			finalTotalPrice = df.format(totalPrice);
		} else if (totalPrice <= 0) {
			shippingFee = "0";
			finalTotalPrice = df.format(totalPrice + 0);
		} else {
			shippingFee = "3,000";
			finalTotalPrice = df.format(totalPrice + 3000);
		}
		
		map.put("originalTotalPrice", originalTotalPrice);
		map.put("shippingFee", shippingFee);
		map.put("finalTotalPrice", finalTotalPrice);
		
		return map;
	}
	
	@RequestMapping("/checkAll")
	@ResponseBody
	public Map<String, String> checkAll(HttpSession session) {
		Customer customer = (Customer)session.getAttribute("customerLogin");
		List<Cart> cartItemList = cartService.getItemsByCustomerId(customer.getCustomerId());
		List<Product> productList = new ArrayList<>();
		
		for (int i=0; i<cartItemList.size(); ++i) {
			cartService.toggleCheckedToTrue(cartItemList.get(i));
			cartItemList.get(i).setCartProductChecked("TRUE");
		}
		
		for (Cart cartItem : cartItemList) {
			int currentProductId = cartItem.getProductId();
			productList.add(productService.getOneProduct(currentProductId));
		}
		
		int totalPrice = 0;
		for (int i=0; i<cartItemList.size(); ++i) {
			if (cartItemList.get(i).getCartProductChecked().equals("TRUE")) {
				totalPrice += cartItemList.get(i).getCartProductQuantity() * productList.get(i).getProductPrice() * (1 - productList.get(i).getProductDiscountRate());
		
			}
		}
		
		Map<String, String> map = new HashMap<String, String>();
		
		DecimalFormat df = new DecimalFormat("###,###,###,###");
		
		String originalTotalPrice = df.format(totalPrice);
		
		String shippingFee = null;
		String finalTotalPrice = null;
		if (totalPrice >= 50000) {
			shippingFee = "무료";
			finalTotalPrice = df.format(totalPrice);
		} else if (totalPrice <= 0) {
			shippingFee = "0";
			finalTotalPrice = df.format(totalPrice + 0);
		} else {
			shippingFee = "3,000";
			finalTotalPrice = df.format(totalPrice + 3000);
		}
		
		map.put("originalTotalPrice", originalTotalPrice);
		map.put("shippingFee", shippingFee);
		map.put("finalTotalPrice", finalTotalPrice);
		
		return map;
	}
	
	@RequestMapping("/uncheckAll")
	@ResponseBody
	public Map<String, String> uncheckAll( HttpSession session) {
		Customer customer = (Customer)session.getAttribute("customerLogin");
		List<Cart> cartItemList = cartService.getItemsByCustomerId(customer.getCustomerId());
		List<Product> productList = new ArrayList<>();
		
		for (int i=0; i<cartItemList.size(); ++i) {
			cartService.toggleCheckedToFalse(cartItemList.get(i));
			cartItemList.get(i).setCartProductChecked("FALSE");
		}
		
		for (Cart cartItem : cartItemList) {
			int currentProductId = cartItem.getProductId();
			productList.add(productService.getOneProduct(currentProductId));
		}
		
		int totalPrice = 0;
		for (int i=0; i<cartItemList.size(); ++i) {
			if (cartItemList.get(i).getCartProductChecked().equals("TRUE")) {
				totalPrice += cartItemList.get(i).getCartProductQuantity() * productList.get(i).getProductPrice() * (1 - productList.get(i).getProductDiscountRate());
		
			}
		}
		
		Map<String, String> map = new HashMap<String, String>();
		
		DecimalFormat df = new DecimalFormat("###,###,###,###");
		
		String originalTotalPrice = df.format(totalPrice);
		
		String shippingFee = null;
		String finalTotalPrice = null;
		if (totalPrice >= 50000) {
			shippingFee = "무료";
			finalTotalPrice = df.format(totalPrice);
		} else if (totalPrice <= 0) {
			shippingFee = "0";
			finalTotalPrice = df.format(totalPrice + 0);
		} else {
			shippingFee = "3,000";
			finalTotalPrice = df.format(totalPrice + 3000);
		}
		
		map.put("originalTotalPrice", originalTotalPrice);
		map.put("shippingFee", shippingFee);
		map.put("finalTotalPrice", finalTotalPrice);
		
		return map;
	}
	
}
