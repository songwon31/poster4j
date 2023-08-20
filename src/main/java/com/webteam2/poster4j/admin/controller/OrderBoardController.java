package com.webteam2.poster4j.admin.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webteam2.poster4j.dto.OrderDetail;
import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.interceptor.Auth;
import com.webteam2.poster4j.interceptor.Auth.Role;
import com.webteam2.poster4j.service.OrderDetailService;
import com.webteam2.poster4j.service.OrderTService;
import com.webteam2.poster4j.service.ProductService;

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
	@Auth(Role.ADMIN)
	public String orderBoard(
			@RequestParam(value="category", required=false) String category, 
			@RequestParam(value="content", required=false) String content, 
			String pageNo, 
			Model model, 
			HttpSession session) 
	{	
		String pastCategory = (String) session.getAttribute("orderDetailSearchCategory");
		String pastContent = (String) session.getAttribute("orderDetailSearchContent");
		if ((category!=null && !category.equals("")) && (content!=null && !content.equals(""))) {
			if (!category.equals(pastCategory) || !content.equals(pastContent)) {
				session.setAttribute("orderDetailSearchCategory", category);
				session.setAttribute("orderDetailSearchContent", content);
				pageNo = "1";
			}
		} else {
			if (pastCategory != null) {
				pageNo = "1";
			}
			session.removeAttribute("orderDetailSearchCategory");
			session.removeAttribute("orderDetailSearchContent");
		}
		
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
		
		if ((category != null && category.equals("orderId")) && (content!=null && !content.equals(""))) {
			int orderId = Integer.parseInt(content);
			int totalOrderDetailNum = orderDetailService.getOrderDetailNumByOrderId(orderId);
			Pager pager = new Pager(10, 5, totalOrderDetailNum, intPageNo);
			model.addAttribute("pager", pager);
			
			int endRowNo = pager.getEndRowNo();
			int startRowNo = pager.getStartRowNo();
			List<OrderDetail> orderDetailList = orderDetailService.getListByOrderId(orderId, endRowNo, startRowNo);
			model.addAttribute("orderDetailList", orderDetailList);
			
			List<Date> orderDateList = new ArrayList<>();
			for (OrderDetail orderDetail : orderDetailList) {
				orderDateList.add(orderTService.getOrderTById(orderDetail.getOrderId()).getOrderDate());
			}
			model.addAttribute("orderDateList", orderDateList);
		} else if ((category != null && category.equals("productId")) && (content!=null && !content.equals(""))) {
			int productId = Integer.parseInt(content);
			int totalOrderDetailNum = orderDetailService.getOrderDetailNumByProductId(productId);
			Pager pager = new Pager(10, 5, totalOrderDetailNum, intPageNo);
			model.addAttribute("pager", pager);
			
			int endRowNo = pager.getEndRowNo();
			int startRowNo = pager.getStartRowNo();
			List<OrderDetail> orderDetailList = orderDetailService.getListByProductId(productId, endRowNo, startRowNo);
			model.addAttribute("orderDetailList", orderDetailList);
			
			List<Date> orderDateList = new ArrayList<>();
			for (OrderDetail orderDetail : orderDetailList) {
				orderDateList.add(orderTService.getOrderTById(orderDetail.getOrderId()).getOrderDate());
			}
			model.addAttribute("orderDateList", orderDateList);
		} else {
			int totalOrderDetailNum = orderDetailService.getTotalOrderDetailNum();
			Pager pager = new Pager(10, 5, totalOrderDetailNum, intPageNo);
			model.addAttribute("pager", pager);
			
			List<OrderDetail> orderDetailList = orderDetailService.getList(pager);
			model.addAttribute("orderDetailList", orderDetailList);
			
			List<Date> orderDateList = new ArrayList<>();
			for (OrderDetail orderDetail : orderDetailList) {
				orderDateList.add(orderTService.getOrderTById(orderDetail.getOrderId()).getOrderDate());
			}
			model.addAttribute("orderDateList", orderDateList);
		}
		
		return "admin/orderBoard";
	}
	
	@GetMapping("/changeOrderStatus")
	@Auth(Role.ADMIN)
	public String changeOrderStatus (int orderId, int productId, String optionSize, String optionFrame, String orderStatus) {
		orderDetailService.changeOrderDetailStatus(orderId, productId, optionSize, optionFrame, orderStatus);
		return "redirect:/admin/orderBoard";
	}
	
}
