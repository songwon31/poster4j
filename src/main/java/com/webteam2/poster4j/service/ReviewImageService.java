package com.webteam2.poster4j.service;

import java.util.List;

import com.webteam2.poster4j.dto.ReviewImage;

public interface ReviewImageService {
	public List<ReviewImage> getReviewImageList(int productId);
	public void register(ReviewImage reviewImage);
}
