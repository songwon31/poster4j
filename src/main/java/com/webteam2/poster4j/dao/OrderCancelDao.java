package com.webteam2.poster4j.dao;

import org.apache.ibatis.annotations.Mapper;

import com.webteam2.poster4j.dto.OrderCancel;

@Mapper
public interface OrderCancelDao {
	public int insertOrderCancel(OrderCancel orderCancel);
}
