package com.webteam2.poster4j.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrderT {
	private int orderId;
	private String customerId;
	private int receiverId;
	private int couponId;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date orderDate;
	private String orderSettlementMethod;
}
