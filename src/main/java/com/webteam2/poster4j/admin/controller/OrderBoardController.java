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
	public String orderBoard(
			@RequestParam(value="category", required=false) String category, 
			@RequestParam(value="content", required=false) String content, 
			String pageNo, 
			Model model, 
			HttpSession session) 
	{
		log.info("category: " + category);
		log.info("content: " + content);
		log.info("pageNo: " + pageNo);
		
		String pastCategory = (String) session.getAttribute("orderDetailSearchCategory");
		// category 검색이 없다가 생긴 경우
		if ((category != null) && (pastCategory == null)) {
			// 세션에 현재 검색 카테고리 저장
			session.setAttribute("orderDetailSearchCategory", category);
			// pageNo 1로 초기화
			pageNo = "1";
		} 
		// category 검색이 있다가 사라진 경우
		else if ((category == null) && (pastCategory != null)) {
			// 세션에서 검색 카테고리 삭제
			session.removeAttribute("orderDetailSearchCategory");
			// pageNo 1로 초기화
			pageNo = "1";
		}
		// category 검색이 있었고, 지금도 있는 경우
		else if ((category != null) && (pastCategory != null)) {
			// 이전 검색 category와 현재 검색 category가 다르다면 페이지 번호 초기화
			if (!category.equals(pastCategory)) {
				// 세션에 현재 검색 카테고리로 교체
				session.setAttribute("orderDetailSearchCategory", category);
				// pageNo 1로 초기화
				pageNo = "1";
			}
		}
		
		String pastContent = (String) session.getAttribute("orderDetailSearchContent");
		// content 검색이 없다가 생긴 경우
		if ((content != null) && (pastContent == null)) {
			// 세션에 현재 검색 카테고리 저장
			session.setAttribute("orderDetailSearchContent", content);
			// pageNo 1로 초기화
			pageNo = "1";
		} 
		// content 검색이 있다가 사라진 경우
		else if ((content == null) && (pastContent != null)) {
			// 세션에서 검색 카테고리 삭제
			session.removeAttribute("orderDetailSearchContent");
			// pageNo 1로 초기화
			pageNo = "1";
		}
		// content 검색이 있었고, 지금도 있는 경우
		else if ((content != null) && (pastContent != null)) {
			// 이전 검색 category와 현재 검색 content가 다르다면 페이지 번호 초기화
			if (!content.equals(pastContent)) {
				// 세션에 현재 검색 카테고리로 교체
				session.setAttribute("orderDetailSearchContent", content);
				// pageNo 1로 초기화
				pageNo = "1";
			}
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
		} else if ((category != null && category.equals("productId")) && (content!=null && !content.equals(""))) {
			int productId = Integer.parseInt(content);
			int totalOrderDetailNum = orderDetailService.getOrderDetailNumByProductId(productId);
			Pager pager = new Pager(10, 5, totalOrderDetailNum, intPageNo);
			model.addAttribute("pager", pager);
			
			int endRowNo = pager.getEndRowNo();
			int startRowNo = pager.getStartRowNo();
			List<OrderDetail> orderDetailList = orderDetailService.getListByProductId(productId, endRowNo, startRowNo);
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
		} else {
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
		}
		
		return "admin/orderBoard";
	}
	
	@GetMapping("/changeOrderStatus")
	public String changeOrderStatus (int orderId, int productId, String orderStatus) {
		orderDetailService.changeOrderDetailStatus(orderId, productId, orderStatus);
		
		return "redirect:/admin/orderBoard";
	}
	
}
