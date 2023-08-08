package com.webteam2.poster4j.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.webteam2.poster4j.dto.OrderInquiry;
import com.webteam2.poster4j.dto.Pager;

@Mapper
public interface OrderInquiryDao {
	public int countTotalOrderInquiry();
	public List<OrderInquiry> selectWithPager(Pager pager);
}
