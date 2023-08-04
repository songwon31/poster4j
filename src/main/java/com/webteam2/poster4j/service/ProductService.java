package com.webteam2.poster4j.service;

import java.util.List;

import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.dto.Product;

public interface ProductService {
	public List<Product> getList(Pager pager);
	public Product getOneProduct(int productId);
	public int getPriceById(int productId);
	public int getTotalProductNum();
	public int registerProduct(Product product);
	public Product getMainPageProduct(int productId);
	public int deleteById(int productId);
}
