package com.webteam2.poster4j.dao;

import org.apache.ibatis.annotations.Mapper;

import com.webteam2.poster4j.dto.OrderInquiryAnswer;

@Mapper
public interface OrderInquiryAnswerDao {
	public int insertAnswer(OrderInquiryAnswer orderInquiryAnswer);
}
