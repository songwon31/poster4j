package com.webteam2.poster4j.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.dto.Product;
import com.webteam2.poster4j.dto.ProductBoardSearch;

@Mapper
public interface ProductDao {
	public List<Product> selectByPage(Pager pager);
	public int selectPriceById(int productId);
	public int count();
	public int insertProduct(Product product);
	public Product selectAllById(int productId);
	public int updateProduct(Product product);
	public int deleteById(int productId);
	
	public int countSearchedProductNum(ProductBoardSearch productBoardSearch);
	public List<Product> selectSearchedProductByPage(@Param("productBoardSearch") ProductBoardSearch productBoardSearch, 
													 @Param("pager") Pager pager);
	public List<Product> selectAll();
}
