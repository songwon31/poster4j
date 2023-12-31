package com.webteam2.poster4j.dto;

import lombok.Data;

@Data
public class Product {
	private int productId;
	private String productName;
	private int productPrice;
	private double productDiscountRate;
	private String productTheme;
	private String productArtist;
	private String productDetail;
	private String productEnabled;
}
