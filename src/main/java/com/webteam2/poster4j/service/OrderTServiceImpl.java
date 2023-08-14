package com.webteam2.poster4j.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam2.poster4j.dao.OrderTDao;
import com.webteam2.poster4j.dto.OrderT;
import com.webteam2.poster4j.dto.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OrderTServiceImpl implements OrderTService {
	@Resource
	OrderTDao orderTDao;
	
	@Override
	public OrderT getOrderTById(int orderId) {
		return orderTDao.selectOrderTById(orderId);
	}
	
	@Override
	public int getTotalOrderTNum() {
		return orderTDao.count();
	}
	
	@Override
	public void saveOrder(OrderT order) {
		orderTDao.insert(order);
	}
	
	@Override
	public List<OrderT> getOrderListById(String customerId) {
		return orderTDao.selectOrderListById(customerId);
	}
	
	@Override
	public List<OrderT> getOrderListPageById(String customerId, Pager pager) {
		return orderTDao.selectOrderListPageById(customerId, pager);
	}
	@Override
	public int getTotalOrderTNumByCustomerId(String customerId) {
		// TODO Auto-generated method stub
		return orderTDao.countByCustomerId(customerId);
	}
}
