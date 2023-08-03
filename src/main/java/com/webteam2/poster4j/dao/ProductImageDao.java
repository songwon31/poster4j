package com.webteam2.poster4j.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductImageDao {
	public String selectProductImageRouteById(int productId);
}
