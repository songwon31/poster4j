package com.webteam2.poster4j.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.webteam2.poster4j.dto.ReviewImage;

@Mapper
public interface ReviewImageDao {
	//review 이미지 List 가져오기
	public List<ReviewImage> selectReviewImageListById(@Param("orderId") int orderId, @Param("productId")int productId, @Param("optionSize") String optionSize, @Param("optionFrame")String optionFrame);
	public void insert(ReviewImage reviewImage);
	public void delete(@Param("orderId") int orderId,
						@Param("productId") int productId,
						@Param("optionSize") String optionSize,
						@Param("optionFrame") String optionFrame
						);
}