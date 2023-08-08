package com.webteam2.poster4j.service;

import java.util.List;

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
	
	@Override
	public int register(ProductImage productImage) {
		return productImageDao.insertProductImage(productImage);
	}
	
	@Override
	public int deleteProductImagesByProductId(int productId) {
		return productImageDao.deleteByProductId(productId);
	}
	
	@Override
	public List<ProductImage> getList() {
		 return productImageDao.selectAll();
	}
}
