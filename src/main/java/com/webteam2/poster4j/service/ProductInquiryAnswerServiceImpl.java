package com.webteam2.poster4j.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam2.poster4j.dao.ProductInquiryAnswerDao;
import com.webteam2.poster4j.dto.ProductInquiryAnswer;

@Service
public class ProductInquiryAnswerServiceImpl implements ProductInquiryAnswerService {
	@Resource
	ProductInquiryAnswerDao productInquiryAnswerDao;
	
	@Override
	public int registerAnswer(ProductInquiryAnswer productInquiryAnswer) {
		return productInquiryAnswerDao.insertAnswer(productInquiryAnswer);
	}
	
	@Override
	public String getAnswerById(int productInquiryId) {
		return productInquiryAnswerDao.selectAnswerById(productInquiryId);
	}
	
	@Override
	public int editAnswer(ProductInquiryAnswer productInquiryAnswer) {
		return productInquiryAnswerDao.updateAnswer(productInquiryAnswer);
	}

	@Override
	public ProductInquiryAnswer getProductInquiryAnswer(int productInquiryId) {
		return productInquiryAnswerDao.selectProductInquiryAnswer(productInquiryId);
	}
}
