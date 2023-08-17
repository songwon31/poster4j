package com.webteam2.poster4j.dto;

import lombok.Data;

@Data
public class ProductReview {
	private int orderId;
	private int productId;
	private String productTheme;
	private String productName;
	private String optionSize;
	private String optionFrame;
	private String productImage;
}
