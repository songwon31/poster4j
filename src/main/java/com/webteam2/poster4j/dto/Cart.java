package com.webteam2.poster4j.dto;

import lombok.Data;

@Data
public class Cart {
	private String customerId;
	private int productId;
	private int cartProductQuantity;
	private	String optionSize;
	private String optionFrame;
	private String cartProductChecked;
}
