package com.webteam2.poster4j.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam2.poster4j.dao.ProductInquiryDao;
import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.dto.ProductInquiry;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductInquiryServiceImpl implements ProductInquiryService {
	@Resource
	ProductInquiryDao productInquiryDao;
	
	@Override
	public int getTotalProductInquiryNum() {
		return productInquiryDao.countTotalProductInquiry();
	}
	
	@Override
	public List<ProductInquiry> getListWithPager(Pager pager) {
		// TODO Auto-generated method stub
		return productInquiryDao.selectWithPager(pager);
	}
}
