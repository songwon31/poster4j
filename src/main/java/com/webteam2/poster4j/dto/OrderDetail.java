package com.webteam2.poster4j.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrderDetail {
	private int orderId;
	private String productId;
	private int orderDetailQuantity;
	private String orderDetailStatus;
	@DateTimeFormat(pattern="yyyy-MM-dd HH-mm")
	private Date OrderDlCmptnDate;
}
