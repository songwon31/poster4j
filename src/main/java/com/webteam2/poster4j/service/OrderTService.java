package com.webteam2.poster4j.service;

import java.util.List;	

import com.webteam2.poster4j.dto.OrderT;
import com.webteam2.poster4j.dto.Pager;

public interface OrderTService {
	public OrderT getOrderTById(int orderId);
	public int getTotalOrderTNum();
	public void saveOrder(OrderT order);
	public List<OrderT> getOrderListById(String customerId);
	public List<OrderT> getOrderListPageById(String customerId, Pager pager);
	public int getTotalOrderTNumByCustomerId(String customerId);
}
