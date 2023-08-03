package com.webteam2.poster4j.service;

import javax.annotation.Resource;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.webteam2.poster4j.dao.CustomerDao;
import com.webteam2.poster4j.dto.Customer;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CustomerServiceImpl implements CustomerService {
	@Resource
	CustomerDao customerDao;
	
	@Override
	public Customer getList(String customerId) {
		return customerDao.selectById(customerId);
		
	}

	@Override
	public JoinResult join(Customer customer) {
		Customer dbCustomer = customerDao.selectById(customer.getCustomerId());
		//중복 아이디 검사
		if(dbCustomer != null) {
			return JoinResult.FAIL_DUPLICATED_MID;
		}
		//비밀번호 암호화
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		customer.setCustomerPassword(passwordEncoder.encode(customer.getCustomerPassword()));
		
		customerDao.insert(customer);
		return JoinResult.SUCCESS;
	}

	
}
