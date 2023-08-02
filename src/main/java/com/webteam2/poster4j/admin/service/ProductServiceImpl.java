package com.webteam2.poster4j.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam2.poster4j.dao.ProductDao;
import com.webteam2.poster4j.dto.OrderDetail;
import com.webteam2.poster4j.dto.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductServiceImpl implements ProductService {
	@Resource
	ProductDao productDao;
	
	@Override
	public int getPriceById(int productId) {
		return productDao.selectPriceById(productId);
	}
	
	@Override
	public int getTotalProductNum() {
		return productDao.count();
	}

}
