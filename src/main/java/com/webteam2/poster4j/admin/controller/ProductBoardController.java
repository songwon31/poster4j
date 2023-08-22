package com.webteam2.poster4j.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.dto.Product;
import com.webteam2.poster4j.dto.ProductBoardSearch;
import com.webteam2.poster4j.dto.ProductBoardSearchForm;
import com.webteam2.poster4j.interceptor.Auth;
import com.webteam2.poster4j.interceptor.Auth.Role;
import com.webteam2.poster4j.service.ProductService;
import com.webteam2.poster4j.validator.ProductSearchValidator;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class ProductBoardController {
	@Resource
	ProductService productService;
	
	@InitBinder("productBoardSearchForm")
	public void ProductBoardSearchFormValidator(WebDataBinder binder) {
		binder.setValidator(new ProductSearchValidator());
	}
	
	@RequestMapping("/productBoard")
	@Auth(Role.ADMIN)
	public String productBoard(Model model, HttpSession session, @Valid ProductBoardSearchForm productBoardSearchForm, Errors errors, String pageNo) {
		if (errors.hasErrors()) {
			log.info("here");
			return "admin/productBoard";
		}
		
		productBoardSearchForm.makeEmptyToNull();
		ProductBoardSearchForm pastProductBoardSearchForm = (ProductBoardSearchForm)session.getAttribute("productBoardSearchForm");

		if (!productBoardSearchForm.equals(pastProductBoardSearchForm)) {
			session.setAttribute("productBoardSearchForm", productBoardSearchForm);
			pageNo = "1";
		}
		
		if (pageNo == null) {
			pageNo = (String)session.getAttribute("pageNo");
			if (pageNo == null) {
				pageNo = "1";
			}
		}
		int intPageNo = Integer.parseInt(pageNo);
		session.setAttribute("pageNo", String.valueOf(pageNo));
		
		ProductBoardSearch productBoardSearch = new ProductBoardSearch();
		productBoardSearch.getDataForm(productBoardSearchForm);
		
		int totalSearchedProductNum = productService.getTotalSearchedProductNum(productBoardSearch);
		Pager pager = new Pager(10, 5, totalSearchedProductNum, intPageNo);
		model.addAttribute("pager", pager);
		
		List<Product> productList = productService.getSearchedProductList(productBoardSearch, pager);
		model.addAttribute("productList", productList);
		
		return "admin/productBoard";
	}
	
	@GetMapping("/removeSearch")
	@Auth(Role.ADMIN)
	public String removeSearch(HttpSession session) {
		session.removeAttribute("productBoardSearch");
		return "redirect:/admin/productBoard";
	}
	
	@GetMapping("/deleteProduct")
	@Auth(Role.ADMIN)
	public String deleteProduct(int productId) {
		productService.deleteById(productId);
		return "redirect:/admin/productBoard";
	}
}
