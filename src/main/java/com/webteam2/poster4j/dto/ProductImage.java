package com.webteam2.poster4j.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductImage {
	private int productImageId;
	private String productImageCtgry;
/*	// Client -> Controller
	private MultipartFile pattach;*/
	private byte[] productImageSource;
	private int productId;
	private String productImageType;
	private String productImageName;
}
