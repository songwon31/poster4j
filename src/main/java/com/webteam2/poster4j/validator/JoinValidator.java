package com.webteam2.poster4j.validator;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.webteam2.poster4j.dto.Customer;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class JoinValidator implements Validator {
	@Override
		public boolean supports(Class<?> clazz) {
			boolean check = Customer.class.isAssignableFrom(clazz);
			return check;
		}
	
	//supports가 true일 경우에만 validate
	@Override
	public void validate(Object target, Errors errors) {

		Customer customer = (Customer) target;
		
		//customerId 검사
		String customerId = customer.getCustomerId();
		if(customerId == null || customerId.equals("")) {
			errors.rejectValue("customerId", "errors.customerId.required", "필수 입력(D)");
		} else if(customerId.length() < 4 ) {
			errors.rejectValue("customerId", "errors.customerId.minlength",new Object[] {4}, "최소 4자 입력(D)");
		} else if(customerId.length() > 16) {
			errors.rejectValue("customerId", "errors.customerId.maxlength",new Object[] {16}, "최대 16자 입력(D)");
		}
		
		//customerName 검사
		String customerName = customer.getCustomerName();
		if(customerName == null || customerName.equals("")) {
			errors.rejectValue("customerName", "errors.customerName.required", "필수 입력(D)");
		}
		
		//customerPassword 검사
		String customerPassword = customer.getCustomerPassword();
		if(customerPassword == null || customerPassword.equals("")) {
			errors.rejectValue("customerPassword", "errors.customerPassword.required", "필수 입력(D)");
		} else {
			String regExp = "^(?=(?:.*?[A-Za-z]))(?=(?:.*?[0-9]))(?=(?:.*?[#?!@$%^&*-])).{8,16}$";
			boolean result = Pattern.matches(regExp, customerPassword);
			if(result == false) {
				errors.rejectValue("customerPassword", "errors.customerPassword.format", "비밀번호 형식에 맞지 않음(D)");
			}
		}
		
		//customerTelno 검사
		String customerTelno = customer.getCustomerTelno();
		if(customerTelno == null || customerTelno.equals("")) {
			errors.rejectValue("customerTelno", "errors.customerTelno.required", "필수 입력(D)");
		} else {
			String regExp = "^(010|011)-[0-9]{3,4}-[0-9]{4}$";
			boolean result = Pattern.matches(regExp, customerTelno);
			if(result == false) {
				errors.rejectValue("customerTelno", "errors.customerTelno.format", "휴대폰번호 형식에 맞지 않음(D)");
			}
		}
		
		//customerEmail 검사
		String customerEmail = customer.getCustomerEmail();
		if(customerEmail == null || customerEmail.equals("")) {
			errors.rejectValue("customerEmail", "errors.customerEmail.required", "필수 입력(D)");
		} else {
			String regExp = "^([\\w-]+(?:\\.[\\w-]+)*)@((?:[\\w-]+\\.)*\\w[\\w-]{0,66})\\.([a-z]{2,6}(?:\\.[a-z]{2})?)$";
			boolean result = Pattern.matches(regExp, customerEmail);
			if(result == false) {
				errors.rejectValue("customerEmail", "errors.customerEmail.format", "이메일 형식에 맞지 않음(D)");
			}
		}
		
		//customerTermAgree 검사
		String customerTermAgree = customer.getCustomerTermAgree();
		if(customerTermAgree == null || customerTermAgree.equals("")) {
			errors.rejectValue("customerTermAgree", "errors.customerTermAgree.required", "필수 입력(D)");
		}
		
		//customerInfoAgree 검사
		String customerInfoAgree = customer.getCustomerInfoAgree();
		if(customerInfoAgree == null || customerInfoAgree.equals("")) {
			errors.rejectValue("customerInfoAgree", "errors.customerInfoAgree.required", "필수 입력(D)");
		}
	}
}
