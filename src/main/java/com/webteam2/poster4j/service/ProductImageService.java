package com.webteam2.poster4j.service;

import com.webteam2.poster4j.dto.ProductImage;

public interface ProductImageService {
	public ProductImage getImage(int productId);
	public int register(ProductImage productImage);
}
