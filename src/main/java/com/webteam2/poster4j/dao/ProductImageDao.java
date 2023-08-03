package com.webteam2.poster4j.dao;

import org.apache.ibatis.annotations.Mapper;

import com.webteam2.poster4j.dto.ProductImage;

@Mapper
public interface ProductImageDao {
	public ProductImage selectProductImageById(int productId);
	public int insertProductImage(ProductImage productImage);
}
