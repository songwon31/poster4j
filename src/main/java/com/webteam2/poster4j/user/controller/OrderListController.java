package com.webteam2.poster4j.user.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam2.poster4j.dto.Customer;
import com.webteam2.poster4j.dto.OrderT;
import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.service.OrderDetailService;
import com.webteam2.poster4j.service.OrderTService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class OrderListController {
	@Resource
	OrderTService orderService;
	@Resource
	OrderDetailService orderDetailService;

	@RequestMapping("/orderList")
	public String getOrderList(HttpSession session, Model model, OrderT order, String pageNo) {
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
		
		/*int totalOrderDetailNum = orderDetailService.getTotalOrderDetailNumById(customer.getCustomerId());
		
		order.setCustomerId(customer.getCustomerId());
		List<OrderT> orderList = orderService.getOrderListById(order.getCustomerId());
		
		model.addAttribute("orderList", orderList);
		
		for(int i=0; i<orderList.size(); i++) {
			orderDetailService.getListByOrderId(order.getOrderId(), endRowNo, startRowNo)
		}*/
		
		return "user/orderList";
	}
}
