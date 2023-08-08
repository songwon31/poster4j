package com.webteam2.poster4j.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrderInquiry {
	private int orderInquiryId;
	private String orderInquiryContent;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date orderInquiryDate;
	private int orderId;
	private String orderInquiryAnswered;
}
