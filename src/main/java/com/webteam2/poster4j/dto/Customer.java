package com.webteam2.poster4j.dto;

import lombok.Data;

@Data
public class Customer {
	private String customerId;
	private String customerPassword;
	private String customerName;
	private String customerTelno;
	private String customerEmail;
	private String customerTermAgree;
	private String customerInfoAgree;
	private String customerSmsAgree;
	private String customerEmailAgree;
	private String customerEnabled;
}
