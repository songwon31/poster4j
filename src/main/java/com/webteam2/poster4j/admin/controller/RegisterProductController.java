package com.webteam2.poster4j.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.webteam2.poster4j.dto.Product;
import com.webteam2.poster4j.dto.ProductImage;
import com.webteam2.poster4j.interceptor.Auth;
import com.webteam2.poster4j.interceptor.Auth.Role;
import com.webteam2.poster4j.service.ProductImageService;
import com.webteam2.poster4j.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class RegisterProductController { 
	@Resource
	ProductService productService;
	@Resource
	ProductImageService productImageService;
	
	@RequestMapping("/registerProductForm")
	@Auth(Role.ADMIN)
	public String registerProductForm (@RequestParam(value="quit", required=false, defaultValue="0") int quit, Model model) {
		if (quit == -1) {
			model.addAttribute("quit", quit);
		}
		return "admin/registerProduct";
	}
	
	@PostMapping("/register") 
	@Auth(Role.ADMIN)
	public String register(HttpServletRequest request, HttpSession session,
			@RequestParam(value="productName")String productName,
			@RequestParam(value="productPrice")int productPrice,
			@RequestParam(value="productDiscountRate")double productDiscountRate,
			@RequestParam(value="productTheme")String productTheme,
			@RequestParam(value="productArtist")String productArtist,
			@RequestParam(value="representImage")MultipartFile representImage,
			@RequestParam(value="detailImages")List<MultipartFile> detailImages,
			@RequestParam(value="productDetail", required=false)String productDetail
			) throws Exception 
		{
		Product newProduct = new Product();
		newProduct.setProductName(productName);
		newProduct.setProductPrice(productPrice);
		newProduct.setProductDiscountRate(productDiscountRate);
		newProduct.setProductTheme(productTheme);
		newProduct.setProductArtist(productArtist);
		if (productDetail != null) {
			newProduct.setProductDetail(productDetail);
		}
		productService.registerProduct(newProduct);
		
		ProductImage productImage = new ProductImage();
		productImage.setProductId(newProduct.getProductId());
		productImage.setProductImageCtgry("REPRESENT");
		MultipartFile mf = representImage;
		productImage.setProductImageName(mf.getOriginalFilename());
		productImage.setProductImageType(mf.getContentType());
		productImage.setProductImageSource(mf.getBytes());
		productImageService.register(productImage);
		
		for (MultipartFile mfd : detailImages) {
			ProductImage detailProductImage = new ProductImage();
			detailProductImage.setProductId(newProduct.getProductId());
			detailProductImage.setProductImageCtgry("DETAIL");
			detailProductImage.setProductImageName(mfd.getOriginalFilename());
			detailProductImage.setProductImageType(mfd.getContentType());
			detailProductImage.setProductImageSource(mfd.getBytes());
			productImageService.register(detailProductImage);
		}
		
		return "redirect:/admin/registerProductForm?quit=-1";
	}
	
}
