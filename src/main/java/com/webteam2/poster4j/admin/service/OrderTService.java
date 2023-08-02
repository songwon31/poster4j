package com.webteam2.poster4j.admin.service;

import com.webteam2.poster4j.dto.OrderT;

public interface OrderTService {
	public OrderT getOrderTById(int orderId);
	public int getTotalOrderTNum();
}
