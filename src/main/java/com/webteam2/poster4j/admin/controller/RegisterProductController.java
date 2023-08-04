package com.webteam2.poster4j.admin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.webteam2.poster4j.dto.Product;
import com.webteam2.poster4j.dto.ProductImage;
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
	public String registerProductForm () {
		
		return "admin/registerProduct";
	}
	
	@PostMapping("/register") 
	public String register(HttpServletRequest request, HttpSession session,
			@RequestParam(value="productName")String productName,
			@RequestParam(value="productPrice")int productPrice,
			@RequestParam(value="productDiscountRate")int productDiscountRate,
			@RequestParam(value="productTheme")String productTheme,
			@RequestParam(value="productArtist")String productArtist,
			@RequestParam(value="productTexture")String productTexture,
			@RequestParam(value="productStock", required=false)String productStock,
			@RequestParam(value="productImageCtgry")String productImageCtgry,
			@RequestParam(value="pattach")MultipartFile pattach
			) throws Exception 
		{
		Product newProduct = new Product();
		newProduct.setProductName(productName);
		newProduct.setProductPrice(productPrice);
		newProduct.setProductDiscountRate(productDiscountRate);
		newProduct.setProductTheme(productTheme);
		newProduct.setProductArtist(productArtist);
		newProduct.setProductTexture(productTexture);
		if (productStock != null && !productStock.equals("")) {
			newProduct.setProductStock(Integer.parseInt(productStock));
		}
		
		log.info("product: " + newProduct);
		
		productService.registerProduct(newProduct);
		
		ProductImage productImage = new ProductImage();
		productImage.setProductId(newProduct.getProductId());
		productImage.setProductImageCtgry(productImageCtgry);
		MultipartFile mf = pattach;
		if (!mf.isEmpty()) {
			productImage.setProductImageName(mf.getOriginalFilename());
			productImage.setProductImageType(mf.getContentType());
			productImage.setProductImageSource(mf.getBytes());
		}
		productImageService.register(productImage);
		
		log.info("productImage: " + productImage);
		
		return "redirect:/admin/productBoard";
	}
	
}
