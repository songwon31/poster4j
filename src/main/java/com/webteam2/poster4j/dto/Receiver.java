package com.webteam2.poster4j.dto;


import lombok.Data;

@Data
public class Receiver {
	private int receiverId;
	private String customerId;
	private String receiverName;
	private String receiverZip;
	private String receiverAddress;
	private String receiverAddressDetail;
	private String receiverTelno;
	private String receiverAddressType;
	private String receiverEnabled;
	private String receiverPersonName;
}
