package com.webteam2.poster4j.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.webteam2.poster4j.dto.OrderT;

@Mapper
public interface OrderTDao {
	public OrderT selectOrderTById(int orderId);
	public int count();
	public void insert(OrderT order);
	public List<OrderT> selectOrderListById(int orderId);
}
