package com.webteam2.poster4j.service;

import javax.annotation.Resource;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.webteam2.poster4j.dao.CustomerDao;
import com.webteam2.poster4j.dao.ReceiverDao;
import com.webteam2.poster4j.dto.Customer;
import com.webteam2.poster4j.dto.Receiver;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CustomerServiceImpl implements CustomerService {
	@Resource
	private CustomerDao customerDao;
	
	@Override
	public Customer getList(String customerId) {
		return customerDao.selectById(customerId);
		
	}

	@Override
	public JoinResult join(Customer customer,
			@RequestParam(value="customerPasswordCheck") String customerPasswordCheck) {
		Customer dbCustomer = customerDao.selectById(customer.getCustomerId());
		//중복 아이디 검사
		if(dbCustomer != null) {
			return JoinResult.FAIL_DUPLICATED_MID;
		}
		
		//비밀번호와 비밀번호 확인 비교
		if(!customer.getCustomerPassword().equals(customerPasswordCheck) ) {
			return JoinResult.FAIL_PASSWORD_CHECK;
		}
		
		//비밀번호 암호화
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		customer.setCustomerPassword(passwordEncoder.encode(customer.getCustomerPassword()));
		
		customerDao.insert(customer);
		return JoinResult.SUCCESS;
	}

	@Override
	public LoginResult login(Customer customer) {
		Customer dbCustomer = customerDao.selectById(customer.getCustomerId());
		if(dbCustomer == null) {
			return LoginResult.FAIL_MID;
		}
		
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		//비밀번호 일치여부 확인
		if(passwordEncoder.matches(customer.getCustomerPassword(), dbCustomer.getCustomerPassword())) {
			return LoginResult.SUCCESS;
		} else {
			return LoginResult.FAIL_MPASSWORD;
		}
	}
	
	@Override
	public void logout(String customerId) {
		//만약 DB에 로그인 정보가 저장되어 있다면, 삭제하는 코드를 작성
	}
	
	
	@Override
	public int modifyCustomerName(Customer customer) {
		return customerDao.updateCustomerName(customer);
	}
	
	@Override
	public int modifyCustomerTelno(Customer customer) {
		return customerDao.updateCustomerTelno(customer);
	}
	
	@Override
	public int modifyCustomerEmail(Customer customer) {
		return customerDao.updateCustomerEmail(customer);
	}
	
	@Override
	public int modifyCustomerPassword(Customer customer) {
		return customerDao.updateCustomerPassword(customer);
	}
	
	

	@Override
	public int checkSmsAgree(Customer customer) {
		return customerDao.updateSmsAgreeTrue(customer);
	}
	
	@Override
	public int uncheckSmsAgree(Customer customer) {
		return customerDao.updateSmsAgreeFalse(customer);
	}
	
	@Override
	public int checkEmailAgree(Customer customer) {
		return customerDao.updateEmailAgreeTrue(customer);
	}
	
	@Override
	public int uncheckEmailAgree(Customer customer) {
		return customerDao.updateEmailAgreeFalse(customer);
	}
	
	
	
}
