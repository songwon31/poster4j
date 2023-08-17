package com.webteam2.poster4j.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.dto.Review;

@Mapper
public interface ReviewDao {
	public List<Review> selectByPage(@Param("productId") int productId, @Param("pager") Pager pager);
	public Review selectReview(@Param("orderId") int orderId,
							@Param("productId") int productId, 
							@Param("optionSize") String optionSize,
							@Param("optionFrame") String optionFrame);
	public int count(int productId);
	public void insert(Review review);
	public void update(Review review);
	public void delete(@Param("orderId") int orderId,
					@Param("productId") int productId, 
					@Param("optionSize") String optionSize,
					@Param("optionFrame") String optionFrame);
}
