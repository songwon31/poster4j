package com.webteam2.poster4j.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewImage {
	private int reviewImageId;
	private int orderId;
	private int productId;
	private String optionSize;
	private String optionFrame;
	private String reviewImageName;
	private String reviewImageType;
	private byte[] reviewImageSource;
	//private String base64Image;
}
