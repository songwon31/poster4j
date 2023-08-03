package com.webteam2.poster4j.service;

import javax.annotation.Resource;

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

	
}
