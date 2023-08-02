package com.webteam2.poster4j.dao;

import org.apache.ibatis.annotations.Mapper;

import com.webteam2.poster4j.dto.Customer;

@Mapper
public interface CustomerDao {
	public Customer selectById(String customerId);
}
