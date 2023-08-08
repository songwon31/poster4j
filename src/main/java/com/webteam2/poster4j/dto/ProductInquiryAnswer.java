package com.webteam2.poster4j.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProductInquiryAnswer {
	private int productInquiryId;
	private String productInquiryAnswerContent;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date productInquiryAnswerDate;
}
