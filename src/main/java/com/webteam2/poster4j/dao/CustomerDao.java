package com.webteam2.poster4j.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.webteam2.poster4j.dto.Customer;

@Mapper
public interface CustomerDao {
	public Customer selectById(String customerId);
	public int insert(Customer customer);
	
	public int updateCustomerName(Customer customer);
	public int updateCustomerTelno(Customer customer);
	public int updateCustomerEmail(Customer customer);
	public int updateCustomerPassword(Customer customer);
	
	public int updateSmsAgreeTrue(Customer customer);
	public int updateSmsAgreeFalse(Customer customer);
	public int updateEmailAgreeTrue(Customer customer);
	public int updateEmailAgreeFalse(Customer customer);
}
