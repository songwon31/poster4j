package com.webteam2.poster4j.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.dto.Receiver;

@Mapper
public interface ReceiverDao {
	public Receiver selectById(int receiverId);
	public int insert(Receiver receiver);
	public int insertAddress(Receiver receiver);
	public List<Receiver> selectByPage(@Param("pager")Pager pager, @Param("customerId") String customerId);
	public int updateById(Receiver receiver);
	public int count();
	public int delete(int receiverId);
	public Receiver selectByCustomerId(String customerId);
	public List<Receiver> selectListByCustomerId(String customerId);
}
