package com.webteam2.poster4j.dto;

import org.springframework.web.bind.annotation.RequestParam;

import lombok.Data;

@Data
public class ProductBoardSearch {
	private String productId;
	private String productName;
	private String productPriceStart;
	private String productPriceEnd;
	private String productDiscountRateStart;
	private String productDiscountRateEnd;
	private String productTheme;
	private String productArtist;
	private String productTexture;
	private String productStockStart;
	private String productStockEnd;

	public boolean isNull() {
		if (productId==null && productName==null && productPriceStart==null && productPriceEnd==null &&
			productDiscountRateStart==null && productDiscountRateEnd==null && productTheme==null &&
			productArtist==null && productTexture==null &&
			productStockStart==null && productStockEnd==null) {
				return true;
		}
		return false;
	}
	
	public boolean isNotNullButEmpty() {
		if (productId=="" && productName=="" && productPriceStart=="" && productPriceEnd=="" &&
			productDiscountRateStart=="" && productDiscountRateEnd=="" && productTheme=="" &&
			productArtist=="" && productTexture=="" &&
			productStockStart=="" && productStockEnd=="") {
				return true;
		}
		return false;
	}
	
	public boolean isEmpty() {
		if (this.isNull() || this.isNotNullButEmpty()) {
			return true;
		}
		return false;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProductBoardSearch other = (ProductBoardSearch) obj;
		
		// 이전에도 검색 내용이 없었고, 현재도 없는 경우
		if (this.isEmpty() && other.isEmpty()) {
			return true;
		}
		// 이전에는 검색 내용이 있었지만, 현재는 사라진 경우
		if (this.isEmpty() && !other.isEmpty()) {
			return false;
		}
		// 이전에는 검색 내용이 없었지만, 현재는 있는 경우
		if (!this.isEmpty() && other.isEmpty()) {
			return false;
		}
		
		// 이전에도 검색 내용이 있었고, 현재도 있는 경우 검색 내용을 비교
		if (!this.productId.equals(other.productId) ||
			!this.productName.equals(other.productName) ||
			!this.productPriceStart.equals(other.productPriceStart) ||
			!this.productPriceEnd.equals(other.productPriceEnd) ||
			!this.productDiscountRateStart.equals(other.productDiscountRateStart) ||
			!this.productDiscountRateEnd.equals(other.productDiscountRateEnd) ||
			!this.productTheme.equals(other.productTheme) ||
			!this.productArtist.equals(other.productArtist) ||
			!this.productTexture.equals(other.productTexture) ||
			!this.productStockStart.equals(other.productStockStart) ||
			!this.productStockEnd.equals(other.productStockEnd)
			)
		{
			return false;
		}
		
		return true;
	}


}
