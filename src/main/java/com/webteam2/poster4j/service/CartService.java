package com.webteam2.poster4j.service;

import java.util.List;

import com.webteam2.poster4j.dto.Cart;

public interface CartService {
	public List<Cart> getItemsByCustomerId(String customerId);
	public int plusQuantity(String customerId, int productId, String optionSize, String optionFrame);
	public int minusQuantity(String customerId, int productId, String optionSize, String optionFrame);
	public int removeItem(String customerId, int productId, String optionSize, String optionFrame);
	public int addItem(Cart cart);
}
