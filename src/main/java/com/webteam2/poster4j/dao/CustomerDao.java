package com.webteam2.poster4j.dao;

import com.webteam2.poster4j.dto.Customer;

public interface CustomerDao {
	public Customer selectById(String customerId);
}
