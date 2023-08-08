package com.webteam2.poster4j.service;

import java.util.List;

import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.dto.ProductImage;

public interface ProductImageService {
	public ProductImage getImage(int productId);
	public int register(ProductImage productImage);
	public int deleteProductImagesByProductId(int productId);
	public List<ProductImage> getList();
}
