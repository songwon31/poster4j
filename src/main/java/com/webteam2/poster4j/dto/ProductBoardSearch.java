package com.webteam2.poster4j.dto;

import lombok.Data;

@Data
public class ProductBoardSearch {
	private Integer productId;
	private String productName;
	private Integer productPriceStart;
	private Integer productPriceEnd;
	private Double productDiscountRateStart;
	private Double productDiscountRateEnd;
	private String productTheme;
	private String productArtist;
	
	public void makeEmptyToNull() {
		if (productName=="") {
			productName = null;
		}
		if (productTheme=="") {
			productTheme = null;
		}
		if (productArtist=="") {
			productArtist = null;
		}
	}

	public boolean isNull() {
		if (productId==null && productName==null && productPriceStart==null && productPriceEnd==null &&
			productDiscountRateStart==null && productDiscountRateEnd==null && productTheme==null &&
			productArtist==null) {
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
		if (this.isNull() && other.isNull()) {
			return true;
		}
		// 이전에는 검색 내용이 있었지만, 현재는 사라진 경우
		if (this.isNull() && !other.isNull()) {
			return false;
		}
		// 이전에는 검색 내용이 없었지만, 현재는 있는 경우
		if (!this.isNull() && other.isNull()) {
			return false;
		}
		
		// 이전에도 검색 내용이 있었고, 현재도 있는 경우 검색 내용을 비교
		if ((this.productId!=null && other.productId==null) ||
			(this.productId==null && other.productId!=null) ||
			(this.productId!=null && other.productId!=null && !this.productId.equals(other.productId))) {
			return false;
		} else if ((this.productName!=null && other.productName==null) ||
			(this.productName==null && other.productName!=null) ||
			(this.productName!=null && other.productName!=null && !this.productName.equals(other.productName))) {
			return false;
		} else if ((this.productPriceStart!=null && other.productPriceStart==null) ||
			(this.productPriceStart==null && other.productPriceStart!=null) ||
			(this.productPriceStart!=null && other.productPriceStart!=null && !this.productPriceStart.equals(other.productPriceStart))) {
			return false;
		} else if ((this.productPriceEnd!=null && other.productPriceEnd==null) ||
			(this.productPriceEnd==null && other.productPriceEnd!=null) ||
			(this.productPriceEnd!=null && other.productPriceEnd!=null && !this.productPriceEnd.equals(other.productPriceEnd))) {
			return false;
		} else if ((this.productDiscountRateStart!=null && other.productDiscountRateStart==null) ||
			(this.productDiscountRateStart==null && other.productDiscountRateStart!=null) ||
			(this.productDiscountRateStart!=null && other.productDiscountRateStart!=null && !this.productDiscountRateStart.equals(other.productDiscountRateStart))) {
			return false;
		} else if ((this.productDiscountRateEnd!=null && other.productDiscountRateEnd==null) ||
			(this.productDiscountRateEnd==null && other.productDiscountRateEnd!=null) ||
			(this.productDiscountRateEnd!=null && other.productDiscountRateEnd!=null && !this.productDiscountRateEnd.equals(other.productDiscountRateEnd))) {
			return false;
		} else if ((this.productTheme!=null && other.productTheme==null) ||
			(this.productTheme==null && other.productTheme!=null) ||
			(this.productTheme!=null && other.productTheme!=null && !this.productTheme.equals(other.productTheme))) {
			return false;
		} else if ((this.productArtist!=null && other.productArtist==null) ||
			(this.productArtist==null && other.productArtist!=null) ||
			(this.productArtist!=null && other.productArtist!=null && !this.productArtist.equals(other.productArtist))) {
			return false;
		}
		/*	
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
		*/
		return true;
	}
	
	public void getDataForm(ProductBoardSearchForm productBoardSearchForm) {
		if (productBoardSearchForm.getProductId() != null) {
			this.productId = Integer.parseInt(productBoardSearchForm.getProductId());
		} else {
			this.productId = null;
		}
		
		if (productBoardSearchForm.getProductName() != null) {
			this.productName = productBoardSearchForm.getProductName();
		} else {
			this.productName = null;
		}
		
		if (productBoardSearchForm.getProductPriceStart() != null) {
			this.productPriceStart = Integer.parseInt(productBoardSearchForm.getProductPriceStart());
		} else {
			this.productPriceStart = null;
		}
		
		if (productBoardSearchForm.getProductPriceEnd() != null) {
			this.productPriceEnd = Integer.parseInt(productBoardSearchForm.getProductPriceEnd());
		} else {
			this.productPriceEnd = null;
		}
		
		if (productBoardSearchForm.getProductDiscountRateStart() != null) {
			this.productDiscountRateStart = Double.parseDouble(productBoardSearchForm.getProductDiscountRateStart());
		} else {
			this.productDiscountRateStart = null;
		}
		
		if (productBoardSearchForm.getProductDiscountRateEnd() != null) {
			this.productDiscountRateEnd = Double.parseDouble(productBoardSearchForm.getProductDiscountRateEnd());
		} else {
			this.productDiscountRateEnd = null;
		}
		
		if (productBoardSearchForm.getProductTheme() != null) {
			this.productTheme = productBoardSearchForm.getProductTheme();
		} else {
			this.productTheme = null;
		}
		
		if (productBoardSearchForm.getProductArtist() != null) {
			this.productArtist = productBoardSearchForm.getProductArtist();
		} else {
			this.productArtist = null;
		}
		
		
	}


}
