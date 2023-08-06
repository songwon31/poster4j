package com.webteam2.poster4j.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam2.poster4j.dao.ProductDao;
import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.dto.Product;
import com.webteam2.poster4j.dto.ProductBoardSearch;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductServiceImpl implements ProductService {
	@Resource
	ProductDao productDao;
	
	@Override
	public List<Product> getList(Pager pager) {
		return productDao.selectByPage(pager);
	}
	
	@Override
	public Product getOneProduct(int productId) {
		return productDao.selectAllById(productId);
	}
	
	@Override
	public int getPriceById(int productId) {
		return productDao.selectPriceById(productId);
	}
	
	@Override
	public int getTotalProductNum() {
		return productDao.count();
	}
	
	@Override
	public int registerProduct(Product product) {
		return productDao.insertProduct(product);
	}
	
	@Override
	public Product getMainPageProduct(int productId) {
		return productDao.selectAllById(productId);
	}
	
	@Override
	public int updateProduct(Product product) {
		return productDao.updateProduct(product);
	}
	
	@Override
	public int deleteById(int productId) {
		return productDao.deleteById(productId);
	}
	
	@Override
	public int getTotalSearchedProductNum(ProductBoardSearch productBoardSearch) {
		return productDao.countSearchedProductNum(productBoardSearch);
	}
	
	@Override
	public List<Product> getSearchedProductList(ProductBoardSearch productBoardSearch, Pager pager) {
		return productDao.selectSearchedProductByPage(productBoardSearch, pager);
	}
}
