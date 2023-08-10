package com.webteam2.poster4j.service;

import java.util.List;

import com.webteam2.poster4j.dto.Cart;

public interface CartService {
	public List<Cart> getItemsByCustomerId(String customerId);
}
