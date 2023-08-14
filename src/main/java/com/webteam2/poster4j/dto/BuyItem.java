package com.webteam2.poster4j.dto;

import java.util.List;

import lombok.Data;

@Data
public class BuyItem {
	private List<OrderDetail> orderDetail;
	private List<Product> product;
	private List<String> productImage;
	
}
