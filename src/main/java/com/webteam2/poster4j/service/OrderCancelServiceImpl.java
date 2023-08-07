package com.webteam2.poster4j.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam2.poster4j.dao.OrderCancelDao;
import com.webteam2.poster4j.dao.OrderDetailDao;
import com.webteam2.poster4j.dto.OrderCancel;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OrderCancelServiceImpl implements OrderCancelService {
	@Resource
	OrderCancelDao orderCancelDao;
	
	public int cancelOrder(OrderCancel orderCancel) {
		return orderCancelDao.insertOrderCancel(orderCancel);
	}
}
