package com.webteam2.poster4j.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam2.poster4j.dao.ProductImageDao;
import com.webteam2.poster4j.dto.ProductImage;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductImageServiceImpl implements ProductImageService {
	@Resource
	ProductImageDao productImageDao;

	@Override
	public ProductImage getImage(int productId) {
		return productImageDao.selectProductImageById(productId);
	}
	
	
}
