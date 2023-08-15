package com.webteam2.poster4j.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrderDetail {
	private int orderId;
	private int productId;
	private int orderDetailQuantity;
	private String orderDetailStatus;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date orderDlCmptnDate;
	private String optionSize;
	private String optionFrame;
	private int orderDetailPrice;
}
