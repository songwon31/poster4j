package com.webteam2.poster4j.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.webteam2.poster4j.dto.CanceledOrder;
import com.webteam2.poster4j.dto.Pager;

@Mapper
public interface CanceledOrderDao {
	public int countTotalCanceledOrder();
	public List<CanceledOrder> selectWithPager(Pager pager);
	public int insertCanceledOrder(CanceledOrder canceledOrder);
	public int updateCmptnDate(@Param("orderId") int orderId, @Param("productId") int productId, @Param("date") Date date);
}
