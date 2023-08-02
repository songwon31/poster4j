package com.webteam2.poster4j.admin.service;

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
	public int getTotalOrderDetailNum() {
		int totalOrderDetailNum = orderDetailDao.count();
		return totalOrderDetailNum;
	}

}
