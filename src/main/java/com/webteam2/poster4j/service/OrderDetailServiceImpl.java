package com.webteam2.poster4j.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam2.poster4j.dao.OrderDetailDao;
import com.webteam2.poster4j.dto.OrderDetail;
import com.webteam2.poster4j.dto.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OrderDetailServiceImpl implements OrderDetailService {
	@Resource
	OrderDetailDao orderDetailDao;
	
	@Override
	public List<OrderDetail> getList(Pager pager) {
		List<OrderDetail> orderDetailList = orderDetailDao.selectByPage(pager);
		return orderDetailList;
	}
	
	@Override
	public List<OrderDetail> getListByOrderId(int orderId, int endRowNo, int startRowNo) {
		List<OrderDetail> orderDetailList = orderDetailDao.selectPageByOrderId(orderId, endRowNo, startRowNo);
		return orderDetailList;
	}
	
	@Override
	public List<OrderDetail> getListByProductId(int productId, int endRowNo, int startRowNo) {
		List<OrderDetail> productDetailList = orderDetailDao.selectPageByProductId(productId, endRowNo, startRowNo);
		return productDetailList;
	}
	
	@Override
	public int getTotalOrderDetailNum() {
		int totalOrderDetailNum = orderDetailDao.countAll();
		return totalOrderDetailNum;
	}
	
	@Override
	public int getOrderDetailNumByOrderId(int orderId) {
		return orderDetailDao.countByOrderId(orderId);
	}
	
	@Override
	public int getOrderDetailNumByProductId(int productId) {
		return orderDetailDao.countByProductId(productId);
	}
	
	@Override
	public int changeOrderDetailStatus(int orderId, int productId, String optionSize, String optionFrame, String orderStatus) {
		return orderDetailDao.updateOrderStatus(orderId, productId, optionSize, optionFrame, orderStatus);
	}
	
	@Override
	public void saveOrderDetail(OrderDetail orderDetail) {
		orderDetailDao.insert(orderDetail);
	}
	
	@Override
	public List<OrderDetail> getListNoPager(int orderId) {
		return orderDetailDao.selectListByOrderId(orderId);
	}
	
}
