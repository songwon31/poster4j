package com.webteam2.poster4j.service;

import com.webteam2.poster4j.dto.OrderInquiryAnswer;

public interface OrderInquiryAnswerService {
	public int registerAnswer(OrderInquiryAnswer orderInquiryAnswer);
	public String getAnswerById(int orderInquiryId);
	public int editAnswer(OrderInquiryAnswer orderInquiryAnswer);
}
