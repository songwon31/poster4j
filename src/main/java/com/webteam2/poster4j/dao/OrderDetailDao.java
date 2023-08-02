package com.webteam2.poster4j.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.webteam2.poster4j.dto.OrderDetail;
import com.webteam2.poster4j.dto.Pager;

@Mapper
public interface OrderDetailDao {
	public List<OrderDetail> selectByPage(Pager pager);
	public int count();
}
