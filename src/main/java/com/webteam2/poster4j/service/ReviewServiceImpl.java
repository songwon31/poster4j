package com.webteam2.poster4j.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam2.poster4j.dao.ReviewDao;
import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.dto.Review;


import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReviewServiceImpl implements ReviewService {
	@Resource
	private ReviewDao reviewDao;

	@Override
	public List<Review> getList(int productId, Pager pager) {
		List<Review> reviewList = reviewDao.selectByPage(productId, pager);
		return reviewList;
	}

	@Override
	public Review getReview(int orderId, int productId, String optionSize, String optionFrame) {
		Review review = reviewDao.selectReview(orderId, productId, optionSize, optionFrame);
		return review;
	}

	@Override
	public int getTotalReviewNum(int productId) {
		int totalReviewNum = reviewDao.count(productId);
		return totalReviewNum;
	}
	@Override
	public void register(Review review) {
		reviewDao.insert(review);
	}
	@Override
	public void modify(Review review) {
		reviewDao.update(review);
	}
	@Override
	public void remove(int orderId, int productId, String optionSize, String optionFrame) {
		reviewDao.delete(orderId, productId, optionSize, optionFrame);
	}
}
