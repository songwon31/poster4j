package com.webteam2.poster4j.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.webteam2.poster4j.dto.ProductImage;

@Mapper
public interface ProductImageDao {
	//productId로 product 이미지 1개 가져오기(represent)
	public ProductImage selectProductImageById(int productId);
	//product 이미지 List 가져오기(detail)
	public List<ProductImage> selectProductImageListById(int productId);
	//public List<ProductImage> selectProductImageListById(int productId);
	//상품 이미지 삽입
	public int insertProductImage(ProductImage productImage);
	public int deleteByProductId(int productId);
	public List<ProductImage> selectAll();
	public List<ProductImage> selectListById(int productId);
	public ProductImage selectRepresentProductImage(int productId);
}
