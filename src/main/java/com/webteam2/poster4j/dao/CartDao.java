package com.webteam2.poster4j.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.webteam2.poster4j.dto.Cart;

@Mapper
public interface CartDao {
	public List<Cart> selectByCustomerId(String customerId);
}
