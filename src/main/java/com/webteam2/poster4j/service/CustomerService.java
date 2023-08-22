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
		FAIL_DUPLICATED_MID,
		FAIL_PASSWORD_CHECK
	}

	public Customer getList(String customerId);
	public JoinResult join(Customer customer, String customerPasswordCheck);
	public LoginResult login(Customer customer);
	public void logout(String customerId);

	public int modifyCustomerName(Customer customer);
	public int modifyCustomerTelno(Customer customer);
	public int modifyCustomerEmail(Customer customer);
	public int modifyCustomerPassword(Customer customer);
	
	public int checkSmsAgree(Customer customer);
	public int uncheckSmsAgree(Customer customer);
	public int checkEmailAgree(Customer customer);
	public int uncheckEmailAgree(Customer customer);
	
	public int withdrawal(String customerId);

}
