package com.webteam2.poster4j.service;

import com.webteam2.poster4j.dto.Customer;

public interface CustomerService {
	public enum JoinResult{
		SUCCESS,
		FAIL_DUPLICATED_MID
	}

	public Customer getList(String customerId);
	public JoinResult join(Customer customer);

}
