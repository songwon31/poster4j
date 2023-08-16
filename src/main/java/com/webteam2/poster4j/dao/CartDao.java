package com.webteam2.poster4j.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.webteam2.poster4j.dto.Cart;

@Mapper
public interface CartDao {
	public List<Cart> selectByCustomerId(String customerId);
	public int insertItem(Cart cart);
	public int updatePlusQuantity(@Param("customerId") String customerId, 
								  @Param("productId") int productId, 
								  @Param("optionSize") String optionSize, 
								  @Param("optionFrame") String optionFrame);
	public int updateMinusQuantity(@Param("customerId") String customerId, 
								  @Param("productId") int productId, 
								  @Param("optionSize") String optionSize, 
								  @Param("optionFrame") String optionFrame);
	public int deleteItem(@Param("customerId") String customerId, 
						@Param("productId") int productId, 
						@Param("optionSize") String optionSize, 
						@Param("optionFrame") String optionFrame);
	public int updateQuantity(@Param("customerId") String customerId, 
			@Param("productId") int productId, 
			@Param("cartProductQuantity") int cartProductQuantity,
			@Param("optionSize") String optionSize, 
			@Param("optionFrame") String optionFrame);
	public int updateCheckedToTrue(Cart cart);
	public int updateCheckedToFalse(Cart cart);
}
