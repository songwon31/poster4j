package com.webteam2.poster4j.dao;

import org.apache.ibatis.annotations.Mapper;

import com.webteam2.poster4j.dto.ProductInquiryAnswer;

@Mapper
public interface ProductInquiryAnswerDao {
	public int insertAnswer(ProductInquiryAnswer productInquiryAnswer);
	public String selectAnswerById(int productInquiryId);
	public int updateAnswer(ProductInquiryAnswer productInquiryAnswer);
}
