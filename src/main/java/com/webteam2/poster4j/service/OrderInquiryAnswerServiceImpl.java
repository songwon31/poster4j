package com.webteam2.poster4j.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam2.poster4j.dao.OrderInquiryAnswerDao;
import com.webteam2.poster4j.dto.OrderInquiryAnswer;

@Service
public class OrderInquiryAnswerServiceImpl implements OrderInquiryAnswerService {
	@Resource
	OrderInquiryAnswerDao orderInquiryAnswerDao;
	
	@Override
	public int registerAnswer(OrderInquiryAnswer orderInquiryAnswer) {
		return orderInquiryAnswerDao.insertAnswer(orderInquiryAnswer);
	}
}
