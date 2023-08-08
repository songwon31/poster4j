package com.webteam2.poster4j.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.dto.ProductInquiry;

@Mapper
public interface ProductInquiryDao {
	public int countTotalProductInquiry();
	public List<ProductInquiry> selectWithPager(Pager pager);
}
