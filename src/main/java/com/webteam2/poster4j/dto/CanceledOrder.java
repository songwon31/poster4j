package com.webteam2.poster4j.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CanceledOrder {
	private int orderId;
	private int productId;
	private String optionSize;
	private String optionFrame;
	private String canceledOrderCategory;
	private String canceledOrderReason;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date canceledOrderReqDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date canceledOrderCmptnDate;
	private String formattedCanceledOrderReqDate;
}
