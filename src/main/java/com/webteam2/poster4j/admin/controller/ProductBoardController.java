package com.webteam2.poster4j.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.dto.Product;
import com.webteam2.poster4j.dto.ProductBoardSearch;
import com.webteam2.poster4j.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class ProductBoardController {
	@Resource
	ProductService productService;
	
	@RequestMapping("/productBoard")
	public String productBoard(ProductBoardSearch productBoardSearch, String pageNo, Model model, HttpSession session) {
		productBoardSearch.makeEmptyToNull();
		
		ProductBoardSearch pastProductBoardSearch = (ProductBoardSearch)session.getAttribute("productBoardSearch");
		/*
		log.info("productBoardSearch: " + productBoardSearch);
		log.info("pastProductBoardSearch: " + pastProductBoardSearch);
		log.info("isEqual: " + productBoardSearch.equals(pastProductBoardSearch));
		log.info("");
		*/
		if (!productBoardSearch.equals(pastProductBoardSearch)) {
			session.setAttribute("productBoardSearch", productBoardSearch);
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
		
		
		
		int totalSearchedProductNum = productService.getTotalSearchedProductNum(productBoardSearch);
		Pager pager = new Pager(10, 5, totalSearchedProductNum, intPageNo);
		model.addAttribute("pager", pager);
		
		List<Product> productList = productService.getSearchedProductList(productBoardSearch, pager);
		model.addAttribute("productList", productList);
		
		return "admin/productBoard";
	}
	
	@GetMapping("/removeSearch")
	public String removeSearch(HttpSession session) {
		session.removeAttribute("productBoardSearch");
		return "redirect:/admin/productBoard";
	}
	
	@GetMapping("/deleteProduct")
	public String deleteProduct(int productId) {
		productService.deleteById(productId);
		return "redirect:/admin/productBoard";
	}
}
