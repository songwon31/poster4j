package com.webteam2.poster4j.service;

import com.webteam2.poster4j.dto.Customer;
import com.webteam2.poster4j.dto.Receiver;

public interface CustomerService {
	public enum LoginResult{
		SUCCESS,
		FAIL_MID,
		FAIL_MPASSWORD
	}
	
	public enum JoinResult{
		SUCCESS,
		FAIL_DUPLICATED_MID
	}

	public Customer getList(String customerId);
	public JoinResult join(Customer customer);
	public LoginResult login(Customer customer);
	public void logout(String customerId);

}
