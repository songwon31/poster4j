package com.webteam2.poster4j.user.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam2.poster4j.dto.BuyItem;
import com.webteam2.poster4j.dto.Customer;
import com.webteam2.poster4j.dto.OrderDetail;
import com.webteam2.poster4j.dto.OrderItem;
import com.webteam2.poster4j.dto.OrderT;
import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.dto.Product;
import com.webteam2.poster4j.dto.ProductImage;
import com.webteam2.poster4j.service.OrderDetailService;
import com.webteam2.poster4j.service.OrderTService;
import com.webteam2.poster4j.service.ProductImageService;
import com.webteam2.poster4j.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class OrderListController {
	@Resource
	OrderTService orderService;
	@Resource
	OrderDetailService orderDetailService;
	@Resource
	ProductImageService productImageService;
	@Resource
	ProductService productService;

	@RequestMapping("/orderList")
	public String getOrderList(HttpSession session, Model model, String pageNo) {
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
		log.info(""+totalOrderNum);
		//customerId에 해당하는 주문 목록 불러오기
		
		List<OrderT> orderList = orderService.getOrderListById(customer.getCustomerId());
		//List<OrderDetail> orderDetailList = new ArrayList<OrderDetail>();
		
		//2차원 리스트
		List<List<OrderDetail>> orderDetailList = new ArrayList<>();
		
		List<BuyItem> buyItemList = new ArrayList<>();
		
		for(int i=0; i<orderList.size(); i++) {
			int orderId = orderList.get(i).getOrderId();
			List<OrderDetail> newOrderDetailList = orderDetailService.getListNoPager(orderId);
			orderDetailList.add(newOrderDetailList);
			
			List<Product> productList = new ArrayList<Product>();
			List<String> productImageList = new ArrayList<String>();
			
			for(OrderDetail orderDetail : newOrderDetailList) {
				int productId = orderDetail.getProductId();
				log.info("" + productId);
				Product product = productService.getOneProduct(productId);
				productList.add(product);
				
				ProductImage productImage = productImageService.getRepresentProductImage(productId);
				String base64Img = Base64.getEncoder().encodeToString(productImage.getProductImageSource());
				
				productImageList.add(base64Img);
				
			}
			BuyItem buyItem = new BuyItem();
			
			buyItem.setOrderDetail(newOrderDetailList);
			buyItem.setProduct(productList);
			buyItem.setProductImage(productImageList);
			
			buyItemList.add(buyItem);
		}
		
		model.addAttribute("buyItemList", buyItemList);
		/*model.addAttribute("productList", productList);
		model.addAttribute("productImageList", productImageList);*/
		
		model.addAttribute("orderDetailList", orderDetailList);
		model.addAttribute("orderList", orderList);
		
		return "user/orderList";
	}
}