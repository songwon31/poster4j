package com.webteam2.poster4j.validator;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.webteam2.poster4j.dto.Receiver;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ReceiverValidator implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		boolean check = Receiver.class.isAssignableFrom(clazz);
		return check;
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		log.info("validate 실행");
		Receiver receiver = (Receiver) target;
		
		//검사해야할 필드 목록
		/*private String receiverName;
		private String receiverPersonName;
		private String receiverZip;
		private String receiverAddress;
		private String receiverTelno;*/
		
		//receiverName 검사
		String receiverName = receiver.getReceiverName();
		
		if(receiverName == null || receiverName.equals("")) {
			errors.rejectValue("receiverName", "errors.receiverName.required");
		}
		
		String receiverPersonName = receiver.getReceiverPersonName();
		
		if(receiverPersonName == null || receiverPersonName.equals("")) {
			errors.rejectValue("receiverPersonName", "errors.receiverPersonName.required");
		}
		
		String receiverZip = receiver.getReceiverZip();
		
		if(receiverZip == null || receiverZip.equals("")) {
			errors.rejectValue("receiverZip", "errors.receiverZip.required");
		}
		
		String receiverAddress = receiver.getReceiverAddress();
		
		if(receiverAddress == null || receiverAddress.equals("")) {
			errors.rejectValue("receiverAddress", "errors.receiverAddress.required");
		}
		
		String receiverTelno = receiver.getReceiverTelno();
				
		if(receiverTelno == null || receiverTelno.equals("")) {
			errors.rejectValue("receiverTelno", "errors.receiverTelno.required");
		}else {
          String regExp = "(010|011)-[0-9]{3,4}-[0-9]{4}";
          boolean result = Pattern.matches(regExp, receiverTelno);
          if(result == false) {
             errors.rejectValue("receiverTelno", "errors.receiverTelno.invalid", "형식에 맞지 않음(D)");
          }
       }
	}
}
