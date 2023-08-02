package com.webteam2.poster4j.admin.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam2.poster4j.admin.service.OrderDetailService;
import com.webteam2.poster4j.admin.service.OrderTService;
import com.webteam2.poster4j.admin.service.ProductService;
import com.webteam2.poster4j.dto.OrderDetail;
import com.webteam2.poster4j.dto.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class OrderBoardController {
	@Resource
	OrderDetailService orderDetailService;
	@Resource
	ProductService productService;
	@Resource
	OrderTService orderTService;
	
	@RequestMapping("/orderBoard")
	public String orderBoard(String pageNo, Model model, HttpSession session) {
		// 브라우저에서 pageNo가 넘어오지 않았을 경우
		if (pageNo == null) {
			// 세션에 저장된 페이지 번호가 있는지 확인
			pageNo = (String)session.getAttribute("pageNo");
			if (pageNo == null) {
				// 저장되어 있지 않다면 "1"로 초기화
				pageNo = "1";
			}
		}
		
		// 문자열을 정수로 전환
		int intPageNo = Integer.parseInt(pageNo);
		//세션에 pageNo를 저장
		session.setAttribute("pageNo", String.valueOf(pageNo));
		
			
		int totalOrderDetailNum = orderDetailService.getTotalOrderDetailNum();
		Pager pager = new Pager(10, 5, totalOrderDetailNum, intPageNo);
		model.addAttribute("pager", pager);
		
		List<OrderDetail> orderDetailList = orderDetailService.getList(pager);
		model.addAttribute("orderDetailList", orderDetailList);
		
		List<Integer> orderDetailPriceList = new ArrayList<>();
		for (OrderDetail orderDetail : orderDetailList) {
			orderDetailPriceList.add(productService.getPriceById(orderDetail.getProductId()) * orderDetail.getOrderDetailQuantity());
		}
		model.addAttribute("orderDetailPriceList", orderDetailPriceList);
		
		List<Date> orderDateList = new ArrayList<>();
		for (OrderDetail orderDetail : orderDetailList) {
			orderDateList.add(orderTService.getOrderTById(orderDetail.getOrderId()).getOrderDate());
		}
		model.addAttribute("orderDateList", orderDateList);
		
		return "admin/orderBoard";
	}
}