package com.webteam2.poster4j.dao;

import org.apache.ibatis.annotations.Mapper;

import com.webteam2.poster4j.dto.OrderT;

@Mapper
public interface OrderTDao {
	public OrderT selectOrderTById(int orderId);
	public int count();
	public void insert(OrderT order);
}
