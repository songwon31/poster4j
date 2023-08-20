package com.webteam2.poster4j.admin.controller;

import java.util.List;

import javax.annotation.Resource;

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
public class UpdateProductController { 
	@Resource
	ProductService productService;
	@Resource
	ProductImageService productImageService;
	
	@RequestMapping("/updateProductForm")
	@Auth(Role.ADMIN)
	public String updateProductForm (int productId, Model model) {
		if (productId != -1) {
			Product product = productService.getOneProduct(productId);
			model.addAttribute("product", product);
		} else {
			model.addAttribute("productId", productId);
		}
		
		return "admin/updateProduct";
	}
	
	@PostMapping("/update") 
	@Auth(Role.ADMIN)
	public String update(
			@RequestParam(value="productId")int productId,
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
		Product product = new Product();
		product.setProductId(productId);
		product.setProductName(productName);
		product.setProductPrice(productPrice);
		product.setProductDiscountRate(productDiscountRate);
		product.setProductTheme(productTheme);
		product.setProductArtist(productArtist);
		if (productDetail != null) {
			product.setProductDetail(productDetail);
		}
		productService.updateProduct(product);
		
		productImageService.deleteProductImagesByProductId(product.getProductId());
		
		ProductImage productImage = new ProductImage();
		productImage.setProductId(product.getProductId());
		productImage.setProductImageCtgry("represent");
		MultipartFile mf = representImage;
		productImage.setProductImageName(mf.getOriginalFilename());
		productImage.setProductImageType(mf.getContentType());
		productImage.setProductImageSource(mf.getBytes());
		
		productImageService.register(productImage);
		
		for (MultipartFile mfd : detailImages) {
			ProductImage detailProductImage = new ProductImage();
			detailProductImage.setProductId(product.getProductId());
			detailProductImage.setProductImageCtgry("detail");
			detailProductImage.setProductImageName(mfd.getOriginalFilename());
			detailProductImage.setProductImageType(mfd.getContentType());
			detailProductImage.setProductImageSource(mfd.getBytes());
			productImageService.register(detailProductImage);
		}
		
		return "redirect:/admin/updateProductForm?productId=-1";
	}
	
}
