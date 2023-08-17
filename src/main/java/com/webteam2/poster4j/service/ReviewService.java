package com.webteam2.poster4j.service;

import java.util.List;

import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.dto.Review;


public interface ReviewService {
	public List<Review> getList(int productId, Pager pager);
	public Review getReview(int orderId, int productId, String optionSize, String optionFrame);
	public int getTotalReviewNum(int productId);
	public void register(Review review);
	public void modify(Review review);
	public void remove(int orderId, int productId, String optionSize, String optionFrame);
}
