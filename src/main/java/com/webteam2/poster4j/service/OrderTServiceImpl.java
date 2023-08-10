package com.webteam2.poster4j.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam2.poster4j.dao.OrderTDao;
import com.webteam2.poster4j.dto.OrderT;

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
}
