package com.webteam2.poster4j.service;

import com.webteam2.poster4j.dto.Product;

public interface ProductService {
	public int getPriceById(int productId);
	public int getTotalProductNum();
	public int registerProduct(Product product);
	public Product getMainPageProduct(int productId);
}
