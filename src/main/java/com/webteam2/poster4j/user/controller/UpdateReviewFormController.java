package com.webteam2.poster4j.user.controller;

import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.webteam2.poster4j.dto.Product;
import com.webteam2.poster4j.dto.ProductImage;
import com.webteam2.poster4j.dto.ProductReview;
import com.webteam2.poster4j.dto.Review;
import com.webteam2.poster4j.dto.ReviewImage;
import com.webteam2.poster4j.service.ProductImageService;
import com.webteam2.poster4j.service.ProductService;
import com.webteam2.poster4j.service.ReviewImageService;
import com.webteam2.poster4j.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UpdateReviewFormController {
	@Resource
	ReviewService reviewService;
	@Resource
	ProductImageService productImageService;
	@Resource
	ProductService productService;
	@Resource
	ReviewImageService reviewImageService;
	
	@RequestMapping("updateReview")
	public String updateReviewForm(HttpSession session, Model model,
								@RequestParam("orderId") int orderId,
								@RequestParam("productId") int productId,
								@RequestParam("optionSize") String optionSize,
								@RequestParam("optionFrame") String optionFrame) {
		log.info(""+ orderId);
		Review review = reviewService.getReview(orderId, productId, optionSize, optionFrame);
		log.info("reviewOrderId" + review.getOrderId());
		ProductImage productImage = productImageService.getImage(review.getProductId());
		Product product = productService.getOneProduct(productId);
		String base64Image = Base64.getEncoder().encodeToString(productImage.getProductImageSource());
		
		ProductReview productReview = new ProductReview();
		productReview.setOrderId(review.getOrderId());
		productReview.setProductId(productId);
		productReview.setProductName(product.getProductName());
		productReview.setProductTheme(product.getProductTheme());
		productReview.setOptionSize(optionSize);
		productReview.setOptionFrame(optionFrame);
		productReview.setProductImage(base64Image);
		
		model.addAttribute("review", review);
		model.addAttribute("productReview", productReview);
		
		return "user/updateReviewForm";
	}
	
	@PostMapping("/postUpdateReview")
	public String postWriteReviewForm(Review review,
									@RequestParam("reviewImages")List<MultipartFile> reviewImages
									) throws Exception {
		Date reviewUpdatedDate = new Date();
		review.setReviewWrittenDate(reviewUpdatedDate);
		reviewService.modify(review);
		log.info(""+ review);
		
		reviewImageService.remove(review.getOrderId(), review.getProductId(), review.getOptionSize(), review.getOptionFrame());
		
		for(MultipartFile mf: reviewImages) {
			ReviewImage reviewImage = new ReviewImage();
			reviewImage.setOrderId(review.getOrderId());
			reviewImage.setProductId(review.getProductId());
			reviewImage.setOptionSize(review.getOptionSize());
			reviewImage.setOptionFrame(review.getOptionFrame());
			reviewImage.setReviewImageName(mf.getOriginalFilename());
			reviewImage.setReviewImageType(mf.getContentType());
			reviewImage.setReviewImageSource(mf.getBytes());
			
			
			reviewImageService.register(reviewImage);
		}
		
		return "redirect:/orderList";
	}
}
