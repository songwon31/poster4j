package com.webteam2.poster4j.service;

import com.webteam2.poster4j.dto.ProductInquiryAnswer;

public interface ProductInquiryAnswerService {
	public int registerAnswer(ProductInquiryAnswer productInquiryAnswer);
	public String getAnswerById(int productInquiryId);
	public int editAnswer(ProductInquiryAnswer productInquiryAnswer);
	public ProductInquiryAnswer getProductInquiryAnswer(int productInquiryId);
}
