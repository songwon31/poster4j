package com.webteam2.poster4j.dao;

import org.apache.ibatis.annotations.Mapper;

import com.webteam2.poster4j.dto.Receiver;

@Mapper
public interface ReceiverDao {
	public Receiver selectById(String receiverId);
	public int insert(Receiver receiver);
}
