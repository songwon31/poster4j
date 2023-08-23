package com.webteam2.poster4j.admin.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam2.poster4j.dto.Customer;
import com.webteam2.poster4j.dto.OrderDetail;
import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.interceptor.Auth;
import com.webteam2.poster4j.interceptor.Auth.Role;
import com.webteam2.poster4j.service.CustomerService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class CustomerBoardController {
	@Resource
	CustomerService customerService;
	
	@RequestMapping("/customerBoard")
	@Auth(Role.ADMIN)
	public String customerBoard(String pageNo, Model model, HttpSession session) {	
		
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
		
		
		int totalCustomerNum = customerService.getTotalCustomerNum();
		Pager pager = new Pager(10, 5, totalCustomerNum, intPageNo);
		model.addAttribute("pager", pager);
		
		List<Customer> customerList = customerService.getList(pager);
		model.addAttribute("customerList", customerList);
		
		return "admin/customerBoard";
	}
	
	@RequestMapping("/deleteCustomer")
	@Auth(Role.ADMIN)
	public String deleteCustomer(String customerId) {
		customerService.withdrawal(customerId);
		
		return "redirect:/admin/customerBoard";
	}
	
}
