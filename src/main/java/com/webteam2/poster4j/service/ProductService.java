package com.webteam2.poster4j.service;

import java.util.List;

import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.dto.Product;
import com.webteam2.poster4j.dto.ProductBoardSearch;

public interface ProductService {
	public List<Product> getList(Pager pager);
	public Product getOneProduct(int productId);
	public int getPriceById(int productId);
	public int getTotalProductNum();
	public int registerProduct(Product product);
	public Product getMainPageProduct(int productId);
	public int updateProduct(Product product);
	public int deleteById(int productId);
	
	public int getTotalSearchedProductNum(ProductBoardSearch productBoardSearch);
	public List<Product> getSearchedProductList(ProductBoardSearch productBoardSearch, Pager pager);
	public List<Product> getList();
	public List<Integer> getAllProductId();
	public List<Product> getListById(int productId);
	public List<Product> getListWithoutLife(ProductBoardSearch productBoardSearch);
	
	
}
