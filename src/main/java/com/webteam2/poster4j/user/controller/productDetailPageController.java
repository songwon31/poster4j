package com.webteam2.poster4j.user.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webteam2.poster4j.dto.Cart;
import com.webteam2.poster4j.dto.Customer;
import com.webteam2.poster4j.dto.OrderItem;
import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.dto.Product;
import com.webteam2.poster4j.dto.ProductImage;
import com.webteam2.poster4j.service.CartService;
import com.webteam2.poster4j.service.ProductImageService;
import com.webteam2.poster4j.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class productDetailPageController {
	@Resource
	ProductService productService;
	@Resource
	ProductImageService productImageService;
	@Resource
	CartService cartService;
	
	@GetMapping("/productDetail")
	public String productDetail(@RequestParam(defaultValue="1", value="productId")int productId, Model model, HttpSession session) {
		//대표 이미지 가져오기
		ProductImage productImage = productImageService.getImage(productId);
		Product product = new Product();

		String convertedImage = Base64.getEncoder().encodeToString(productImage.getProductImageSource());
		product = productService.getOneProduct(productImage.getProductId());
		
		model.addAttribute("convertedImage", convertedImage);
		model.addAttribute("product", product);
		
		//상세설명 이미지 리스트 가져오기
		List<ProductImage> productDetailImageList = productImageService.getDetailImageList(productId);
		List<String> convertedImages = new ArrayList<String>();
		
		for (ProductImage image : productDetailImageList) {
			String base64Img = Base64.getEncoder().encodeToString(image.getProductImageSource());
			convertedImages.add(base64Img);
		}
		
		model.addAttribute("convertedImages", convertedImages);
		
		//상세설명 이미지 리스트에 공통 이미지인 frameDetail 추가하기
		ProductImage frameDetail = productImageService.getFrameDetailImage();
		String convertedFrameDetail = Base64.getEncoder().encodeToString(frameDetail.getProductImageSource());
		
		model.addAttribute("frameDetail", convertedFrameDetail);
		
		//할인된 상품가격 계산
		double discountedPrice = product.getProductPrice() * (1.0 - product.getProductDiscountRate());
		double discountAmount = product.getProductPrice() * product.getProductDiscountRate();
		
		model.addAttribute("discountedPrice", discountedPrice);
		model.addAttribute("discountAmount", discountAmount);
		
		return "user/productDetailPage";
	}
	
	@PostMapping("/addOrderList")
	@ResponseBody
	public String addOrderList(
			OrderItem orderItem,
			HttpSession session) {
		
		/*
		//orderItemList가 없을 경우, 새로 생성해서 저장
		if(orderItemList == null) {
			orderItemList = new ArrayList<OrderItem>();
			session.setAttribute("orderItemList", orderItemList);
		}
		
		//orderItemList에 해당 아이템이 있는 지 조사
		boolean exist = false;
		for(OrderItem item : orderItemList) {
			if(item.getProductId()==orderItem.getProductId()) {
				item.setProductQuantity(item.getProductQuantity() + orderItem.getProductQuantity());
				exist = true;
			}
		}
		
		//orderItemList에 없는 새로운 아이템일 경우
		if(exist == false) {
			orderItemList.add(orderItem);
		}
		*/
		
		return "success";
	}
	
	@RequestMapping("/saveCart")
	@ResponseBody
	public String saveCart(@RequestBody String data, HttpSession session) {
		JSONArray jsonArray = new JSONArray(data);
		String customerId = ((Customer)session.getAttribute("customerLogin")).getCustomerId();
		for(int i=0; i<jsonArray.length(); i++) {
			Cart cart = new Cart();
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			cart.setProductId(jsonObject.getInt("productId"));
			cart.setCustomerId(customerId);
			cart.setOptionSize(jsonObject.getString("productSize"));
			cart.setOptionFrame(jsonObject.getString("productFrame"));
			cart.setCartProductQuantity(jsonObject.getInt("productQuantity"));
			
			//cart 테이블에 데이터 저장하기
			cartService.addItem(cart);
		}
		return "success";
	}
	
	@RequestMapping("/getCustomerId")
	@ResponseBody
	public String getCustomerId(HttpSession session) {
		return ((Customer)session.getAttribute("customerLogin")).getCustomerId();
	}
}
