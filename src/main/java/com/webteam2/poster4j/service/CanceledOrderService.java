package com.webteam2.poster4j.service;

import java.util.Date;
import java.util.List;

import com.webteam2.poster4j.dto.CanceledOrder;
import com.webteam2.poster4j.dto.Pager;

public interface CanceledOrderService {
	public int getTotalCanceledOrderNum();
	public int getTotalCanceledOrderNum2(int orderId, int productId, String optionSize, String optionFrame);
	public List<CanceledOrder> getListWithPager(Pager pager);
	public List<CanceledOrder> getListWithPagerAndId(Pager pager, int orderId);
	public int cancelOrder(CanceledOrder canceledOrder);
	public int registerCmptnDate(int orderId, int productId, Date date);
	public CanceledOrder getCanceledOrder(int orderId, int productId, String optionSize, String optionFrame, Pager pager);
}
