package com.webteam2.poster4j.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrderInquiryImage {
	private int orderInquiryImageId;
	private int orderInquiryId;
	private String orderInquiryImageSource;
}
