package com.webteam2.poster4j.dto;

import lombok.Data;

@Data
public class Customer {
	private String customerId;
	private String customerPassword;
	private String customerName;
	private String customerTelNo;
	private String customerEmail;
	private int customerAdApprove;
}
