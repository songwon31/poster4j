package com.webteam2.poster4j.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam2.poster4j.dao.ReviewImageDao;
import com.webteam2.poster4j.dto.ReviewImage;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReviewImageServiceImpl implements ReviewImageService {
	@Resource
	ReviewImageDao reviewImageDao;
	
	@Override
	public List<ReviewImage> getReviewImageList(int productId) {
		return reviewImageDao.selectReviewImageListById(productId);
	}
}
