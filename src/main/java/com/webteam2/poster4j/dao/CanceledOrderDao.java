package com.webteam2.poster4j.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.webteam2.poster4j.dto.CanceledOrder;
import com.webteam2.poster4j.dto.Pager;

@Mapper
public interface CanceledOrderDao {
	public int countTotalCanceledOrder();
	public List<CanceledOrder> selectWithPager(Pager pager);
}
