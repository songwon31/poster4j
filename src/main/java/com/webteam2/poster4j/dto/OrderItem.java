package com.webteam2.poster4j.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 
 * @author 김철
 * 이 OrderItem 객체는 주문페이지로 값을 전달하기 위한 DTO(Data Transfer Obejct)입니다. 
 * 많관부
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderItem {
	private int productId;
	private String customerId;
	private int productQuantity;
	private String productSize;
	private String productFrame;
	private List<OrderItem> orderItemList;
	
	public OrderItem(int productId, String customerId, int productQuantity, String productSize, String productFrame) {
		this.productId = productId;
		this.customerId = customerId;
		this.productQuantity = productQuantity;
		this.productSize = productSize;
		this.productFrame = productFrame;
	}
}
