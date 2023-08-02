package com.webteam2.poster4j.admin.service;

import java.util.List;

import com.webteam2.poster4j.dto.OrderDetail;
import com.webteam2.poster4j.dto.Pager;

public interface OrderDetailService {
	public List<OrderDetail> getList(Pager pager);
	public int getTotalOrderDetailNum();
}
