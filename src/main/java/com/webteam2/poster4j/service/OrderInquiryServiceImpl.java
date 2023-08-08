package com.webteam2.poster4j.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam2.poster4j.dao.OrderInquiryDao;
import com.webteam2.poster4j.dto.OrderInquiry;
import com.webteam2.poster4j.dto.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OrderInquiryServiceImpl implements OrderInquiryService {
	@Resource
	OrderInquiryDao orderInquiryDao;
	
	@Override
	public int getTotalOrderInquiryNum() {
		return orderInquiryDao.countTotalOrderInquiry();
	}
	
	@Override
	public List<OrderInquiry> getListWithPager(Pager pager) {
		return orderInquiryDao.selectWithPager(pager);
	}
}
