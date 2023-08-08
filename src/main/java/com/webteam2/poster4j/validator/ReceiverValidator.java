package com.webteam2.poster4j.validator;

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
			errors.rejectValue("receiverName", "errors.form.required", "필수 입력(D)");
		}
	}
}
