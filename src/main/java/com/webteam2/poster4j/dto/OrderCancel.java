package com.webteam2.poster4j.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrderCancel {
	private int orderId;
	private int productId;
	private String orderCancelCategory;
	private String orderCancelReason;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date OrderCancelReqDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date OrderCancelCmptnDate;
}
