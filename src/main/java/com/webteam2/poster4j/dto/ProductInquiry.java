package com.webteam2.poster4j.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProductInquiry {
	private int productInquiryId;
	private int customerId;
	private int productId;
	private String productInquiryContent;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date productInquiryDate;
	private String productInquiryAnswered;
}
