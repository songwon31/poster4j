package com.webteam2.poster4j.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrderInquiryAnswer {
	private int orderInquiryId;
	private String orderInquiryAnsContent;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date orderInquiryAnsDate;
}
