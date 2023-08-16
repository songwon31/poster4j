package com.webteam2.poster4j.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Review {
	private int orderId;
	private int productId;
	private String optionSize;
	private String optionFrame;
	private int reviewStarRating;
	private String reviewContent;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date reviewWrittenDate;
}
