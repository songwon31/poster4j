package com.webteam2.poster4j.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductDao {
	public int selectPriceById(int productId);
	public int count();
}
