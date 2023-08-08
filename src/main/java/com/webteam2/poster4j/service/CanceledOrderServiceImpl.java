package com.webteam2.poster4j.service;

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
}
