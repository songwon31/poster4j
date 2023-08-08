package com.webteam2.poster4j.service;

import java.util.List;

import com.webteam2.poster4j.dto.CanceledOrder;
import com.webteam2.poster4j.dto.Pager;

public interface CanceledOrderService {
	public int getTotalCanceledOrderNum();
	public List<CanceledOrder> getListWithPager(Pager pager);
}
