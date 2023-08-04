package com.webteam2.poster4j.dao;

import org.apache.ibatis.annotations.Mapper;

import com.webteam2.poster4j.dto.Product;

@Mapper
public interface ProductDao {
	public int selectPriceById(int productId);
	public int count();
	public int insertProduct(Product product);
	public Product selectAllById(int productId);
}
