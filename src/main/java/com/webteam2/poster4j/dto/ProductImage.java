package com.webteam2.poster4j.dto;

import lombok.Data;

@Data
public class ProductImage {
	private int productImageId;
	private String productImageCtgry;
	private byte[] productImage;
	private int productId;
	private String productImageType;
}