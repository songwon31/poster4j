package com.webteam2.poster4j.service;

import java.util.List;

import com.webteam2.poster4j.dto.OrderInquiry;
import com.webteam2.poster4j.dto.Pager;

public interface OrderInquiryService {
	public int getTotalOrderInquiryNum();
	public List<OrderInquiry> getListWithPager(Pager pager);
}
