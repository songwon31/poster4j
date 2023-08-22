package com.webteam2.poster4j.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.webteam2.poster4j.dto.ProductBoardSearchForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ProductSearchValidator implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		boolean check = ProductBoardSearchForm.class.isAssignableFrom(clazz);
		return check;
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		log.info("validate 실행");
		ProductBoardSearchForm productBoardSearchForm = (ProductBoardSearchForm) target;
		
		if (productBoardSearchForm.getProductId() != null && !productBoardSearchForm.getProductId().equals("")) {
			try {
				Integer.parseInt(productBoardSearchForm.getProductId());
			} catch (NumberFormatException e) {
				log.info("error1");
				errors.rejectValue("productId", "errors.productId.invalid");
			}
		}
		
		if (productBoardSearchForm.getProductPriceStart() != null && !productBoardSearchForm.getProductPriceStart().equals("")) {
			try {
				Integer.parseInt(productBoardSearchForm.getProductPriceStart());
				if (Integer.parseInt(productBoardSearchForm.getProductPriceStart()) < 0) {
					log.info("error2");
					errors.rejectValue("productPriceStart", "errors.productPriceStart.invalid");
				}
			} catch (NumberFormatException e) {
				log.info("error3");
				errors.rejectValue("productPriceStart", "errors.productPriceStart.invalid");
			}
		}
		
		if (productBoardSearchForm.getProductPriceEnd() != null && !productBoardSearchForm.getProductPriceEnd().equals("")) {
			try {
				Integer.parseInt(productBoardSearchForm.getProductPriceEnd());
				if (Integer.parseInt(productBoardSearchForm.getProductPriceEnd()) < 0) {
					log.info("error4");
					errors.rejectValue("productPriceEnd", "errors.productPriceEnd.invalid");
				}
			} catch (NumberFormatException e) {
				log.info("error5");
				errors.rejectValue("productPriceEnd", "errors.productPriceEnd.invalid");
			}
		}
		
		if (productBoardSearchForm.getProductDiscountRateStart() != null && !productBoardSearchForm.getProductDiscountRateStart().equals("")) {
			try {
				Double.parseDouble(productBoardSearchForm.getProductDiscountRateStart());
				if (Double.parseDouble(productBoardSearchForm.getProductDiscountRateStart()) > 1.0 || 
						Double.parseDouble(productBoardSearchForm.getProductDiscountRateStart()) < 0.0) {
					log.info("error6");
					errors.rejectValue("productDiscountRateStart", "errors.productDiscountRateStart.invalid");
				}
			} catch (NumberFormatException e) {
				log.info("error7");
				errors.rejectValue("productDiscountRateStart", "errors.productDiscountRateStart.invalid");
			}
		}
		
		if (productBoardSearchForm.getProductDiscountRateEnd() != null && !productBoardSearchForm.getProductDiscountRateEnd().equals("")) {
			try {
				Double.parseDouble(productBoardSearchForm.getProductDiscountRateEnd());
				if (Double.parseDouble(productBoardSearchForm.getProductDiscountRateEnd()) > 1.0 || 
						Double.parseDouble(productBoardSearchForm.getProductDiscountRateEnd()) < 0.0) {
					log.info("error8");
					errors.rejectValue("productDiscountRateEnd", "errors.productDiscountRateEnd.invalid");
				}
			} catch (NumberFormatException e) {
				log.info("error9");
				errors.rejectValue("productDiscountRateEnd", "errors.productDiscountRateEnd.invalid");
			}
		}
	}
}
