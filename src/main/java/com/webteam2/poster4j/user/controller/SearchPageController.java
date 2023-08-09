package com.webteam2.poster4j.user.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.dto.Product;
import com.webteam2.poster4j.dto.ProductBoardSearch;
import com.webteam2.poster4j.dto.ProductImage;
import com.webteam2.poster4j.service.ProductImageService;
import com.webteam2.poster4j.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SearchPageController {
	@Resource
	ProductImageService productImageService;
	@Resource
	ProductService productService;

	@GetMapping("/search")
	public String search(ProductBoardSearch productBoardSearch, String pageNo, Model model, HttpSession session) {
		log.info("productBoardSearch: " + productBoardSearch);
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
		Pager pager = new Pager(15, 5, totalSearchedProductNum, intPageNo);
		model.addAttribute("pager", pager);
		
		List<Product> productList = productService.getSearchedProductList(productBoardSearch, pager);
		model.addAttribute("productList", productList);

		List<Integer> productIds = new ArrayList<Integer>();
		for (Product product : productList) {
			productIds.add(product.getProductId());
		}
		
		List<String> convertedImages = new ArrayList<String>();
		for (Integer productId : productIds) {
			List<ProductImage> productImages = productImageService.getOrderProductImageList(productId);
			for (ProductImage image : productImages) {
				String base64Img = Base64.getEncoder().encodeToString(image.getProductImageSource());
				convertedImages.add(base64Img);
			}
		}
		model.addAttribute("convertedImages", convertedImages);
		
		return "user/searchPage";
	}
	
	@GetMapping("/removeSearch")
	public String removeSearch(HttpSession session) {
		session.removeAttribute("productBoardSearch");
		return "redirect:/search";
	}
}
