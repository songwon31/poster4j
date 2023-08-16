package com.webteam2.poster4j.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.dto.Review;

@Mapper
public interface ReviewDao {
	public List<Review> selectByPage(@Param("productId") int productId, @Param("pager") Pager pager);
	public Review selectReview(int orderId, int productId, String optionSize, String optionFrame);
	public int count(int productId);
}
