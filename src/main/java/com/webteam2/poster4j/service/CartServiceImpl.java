package com.webteam2.poster4j.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam2.poster4j.dao.CartDao;
import com.webteam2.poster4j.dto.Cart;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CartServiceImpl implements CartService {
	@Resource
	CartDao cartDao;
	
	@Override
	public List<Cart> getItemsByCustomerId(String customerId) {
		return cartDao.selectByCustomerId(customerId);
	}
}
