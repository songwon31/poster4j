package com.webteam2.poster4j.user.controller;

import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.webteam2.poster4j.dto.Customer;
import com.webteam2.poster4j.dto.ProductImage;
import com.webteam2.poster4j.dto.ProductReview;
import com.webteam2.poster4j.dto.Review;
import com.webteam2.poster4j.dto.ReviewImage;
import com.webteam2.poster4j.service.ProductImageService;
import com.webteam2.poster4j.service.ReviewImageService;
import com.webteam2.poster4j.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class WriteReviewFormController {
	@Resource
	ProductImageService productImageService;
	@Resource
	ReviewService reviewService;
	@Resource
	ReviewImageService reviewImageService;
	
	@GetMapping("/writeReview")
	public String getWriteReviewForm(HttpSession session, Model model,
									@RequestParam("orderId") int orderId,
									@RequestParam("productId") int productId,
									@RequestParam("productName") String productName,
									@RequestParam("productTheme") String productTheme,
									@RequestParam("optionSize") String optionSize,
									@RequestParam("optionFrame") String optionFrame,
									@RequestParam("orderDetailStatus") String orderDetailStatus
									) {
		// 세션에 저장된 customer 정보
		Customer customer = (Customer) session.getAttribute("customerLogin");
		if (customer == null) {
			// 로그인 정보가 없으면 로그인 페이지로 이동하거나 필요한 처리를 수행
			return "redirect:/login"; // 로그인 페이지로 리다이렉트
		}
		
		if(orderDetailStatus.equals("배송완료")) {
			log.info("리뷰작성 폼 실행");
			ProductReview productReview = new ProductReview();
			
			productReview.setOrderId(orderId);
			productReview.setProductId(productId);
			productReview.setProductName(productName);
			productReview.setProductTheme(productTheme);
			productReview.setOptionSize(optionSize);
			productReview.setOptionFrame(optionFrame);
			
			ProductImage productImage = productImageService.getRepresentProductImage(productReview.getProductId());
			String base64Image = Base64.getEncoder().encodeToString(productImage.getProductImageSource());
			productReview.setProductImage(base64Image);
			
			model.addAttribute("productReview", productReview);
			
			
			return "user/writeReviewForm";
		}
		
		return "redirect:/orderList";
	}
	
	@PostMapping("/postWriteReview")
	public String postWriteReviewForm(Review review,
									@RequestParam("reviewImages")List<MultipartFile> reviewImages
									) throws Exception {
		Date reviewWrittenDate = new Date();
		review.setReviewWrittenDate(reviewWrittenDate);
		reviewService.register(review);
		log.info(""+ review);
		
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
	
	@GetMapping("/deleteReview")
	public String deleteReviewForm(@RequestParam("orderId") int orderId,
									@RequestParam("productId") int productId,
									@RequestParam("optionSize") String optionSize,
									@RequestParam("optionFrame") String optionFrame
									) {
		reviewService.remove(orderId, productId, optionSize, optionFrame);
		reviewImageService.remove(orderId, productId, optionSize, optionFrame);
		return "redirect:/orderList";
	}
}
