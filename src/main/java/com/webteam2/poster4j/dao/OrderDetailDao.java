package com.webteam2.poster4j.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.webteam2.poster4j.dto.OrderDetail;
import com.webteam2.poster4j.dto.Pager;

@Mapper
public interface OrderDetailDao {
	public List<OrderDetail> selectByPage(Pager pager);
	public List<OrderDetail> selectPageByOrderId(@Param("orderId")int orderId, @Param("endRowNo")int endRowNo, @Param("startRowNo")int startRowNo);
	public List<OrderDetail> selectPageByProductId(@Param("productId")int productId, @Param("endRowNo")int endRowNo, @Param("startRowNo")int startRowNo);
	public int countAll();
	public int countByOrderId(int orderId);
	public int countByProductId(int productId);
	public int updateOrderStatus(@Param("orderId")int orderId, @Param("productId")int productId, @Param("orderStatus")String orderStatus);
	public int insert(OrderDetail orderDetail);
}
