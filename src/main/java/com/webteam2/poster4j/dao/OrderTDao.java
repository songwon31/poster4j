package com.webteam2.poster4j.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.webteam2.poster4j.dto.OrderT;
import com.webteam2.poster4j.dto.Pager;

@Mapper
public interface OrderTDao {
	public OrderT selectOrderTById(int orderId);
	public int count();
	public int countByCustomerId(String customerId);
	public void insert(OrderT order);
	public List<OrderT> selectOrderListById(String customerId);
	public List<OrderT> selectOrderListPageById(@Param("customerId")String customerId, @Param("pager")Pager pager);
}
