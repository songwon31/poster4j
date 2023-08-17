package com.webteam2.poster4j.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.webteam2.poster4j.dto.ReviewImage;

@Mapper
public interface ReviewImageDao {
	//review 이미지 List 가져오기
	public List<ReviewImage> selectReviewImageListById(int productId);
}