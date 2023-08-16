package com.webteam2.poster4j.service;

import java.util.List;

import com.webteam2.poster4j.dto.OrderDetail;
import com.webteam2.poster4j.dto.Pager;

public interface OrderDetailService {
	public List<OrderDetail> getList(Pager pager);
	public List<OrderDetail> getListByOrderId(int orderId, int endRowNo, int startRowNo);
	public List<OrderDetail> getListByProductId(int productId, int endRowNo, int startRowNo);
	public int getTotalOrderDetailNum();
	public int getOrderDetailNumByOrderId(int orderId);
	public int getOrderDetailNumByProductId(int productId);
	public int changeOrderDetailStatus(int orderId, int productId, String optionSize, String optionFrame, String orderStatus);
	public void saveOrderDetail(OrderDetail orderDetail);
	public List<OrderDetail> getListNoPager(int orderId);
}

