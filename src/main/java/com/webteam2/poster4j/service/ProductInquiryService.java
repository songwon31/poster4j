package com.webteam2.poster4j.service;

import java.util.List;

import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.dto.ProductInquiry;

public interface ProductInquiryService {
	public int getTotalProductInquiryNum();
	public List<ProductInquiry> getListWithPager(Pager pager);
	public List<ProductInquiry> getListWithProductIdPager(int productId, Pager pager);
	public int setAnsweredTrue(int productInquiryId);
	public String getContentById(int productInquiryId);
	public int getEachProductInquiryNum(int productId);
}
