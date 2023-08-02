package com.webteam2.poster4j.admin.service;

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
	
	public OrderT getOrderTById(int orderId) {
		return orderTDao.selectOrderTById(orderId);
	}
	public int getTotalOrderTNum() {
		return orderTDao.count();
	}

}
