package com.webteam2.poster4j.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.dto.ProductInquiry;

@Mapper
public interface ProductInquiryDao {
	public int countTotalProductInquiry();
	public List<ProductInquiry> selectWithPager(Pager pager);
	public List<ProductInquiry> selectWithProductIdPager(@Param("productId") int productId, @Param("pager") Pager pager);
	public int updateAnsweredToTrue(int productInquiryId);
	public String selectContentById(int productInquiryId);
	public int countEachProductInquiry(int productId);
	public ProductInquiry insertProductInquiry(ProductInquiry productInquiry);
}
