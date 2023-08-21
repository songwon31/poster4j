package com.webteam2.poster4j.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam2.poster4j.dao.CanceledOrderDao;
import com.webteam2.poster4j.dto.CanceledOrder;
import com.webteam2.poster4j.dto.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CanceledOrderServiceImpl implements CanceledOrderService {
	@Resource
	CanceledOrderDao canceledOrderDao;
	
	@Override
	public int getTotalCanceledOrderNum() {
		return canceledOrderDao.countTotalCanceledOrder();
	}
	
	@Override
	public List<CanceledOrder> getListWithPager(Pager pager) {
		return canceledOrderDao.selectWithPager(pager);
	}
	
	@Override
	public int cancelOrder(CanceledOrder canceledOrder) {
		return canceledOrderDao.insertCanceledOrder(canceledOrder);
	}
	
	@Override
	public int registerCmptnDate(int orderId, int productId, Date date) {
		return canceledOrderDao.updateCmptnDate(orderId, productId, date);
	}
	
	@Override
	public int getTotalCanceledOrderNum2(int orderId, int productId, String optionSize, String optionFrame) {
		return canceledOrderDao.countTotalCanceledOrder2(orderId, productId, optionSize, optionFrame);
	}
	
	@Override
	public List<CanceledOrder> getListWithPagerAndId(Pager pager, int orderId) {
		return canceledOrderDao.selectWithPagerAndId(pager, orderId);
	}
	
	@Override
	public CanceledOrder getCanceledOrder(int orderId, int productId, String optionSize, String optionFrame, Pager pager) {
		return canceledOrderDao.selectCanceledOrder(orderId, productId, optionSize, optionFrame, pager);
	}
}
