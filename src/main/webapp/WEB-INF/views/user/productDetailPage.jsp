<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/productDetailPageStyle.css"/>

<div class="wrapper">
	<div class="productDetailContent d-flex flex-column align-items-center">
		<h2 id="productTitle">${product.productName}</h2>
		<img id="productImage" src="${pageContext.request.contextPath}/resources/images/${productImage.productImageSource}.png"/>
		<h3 id="productName">${product.productName}</h3>
		<table class="productDetailTable mb-3">
			<tr class="priceGroup">
				<th>Price</th>
				<td>
					<span>KRW</span>
					<span>${product.productPrice}</span>
				</td>
			</tr>
			<tr class="discountedPriceGroup">
				<th>Discounted Price</th>
				<td>
					<span>KRW</span>
					<span>${product.productDiscountRate}</span>
					<span>(KRW</span>
					<span>${product.productDiscountRate}</span>
					<span>할인)</span>
				</td>
			</tr>
			<tr class="sizeGroup">
				<th>Size</th>
				<td>
					<select>
						<option>--옵션을 선택해주세요--</option>
						<option>Long size - 1350*2000mm</option>
					</select>
				</td>
			</tr>
		</table>
		<div class="totalPrice"></div>
		<div class="btnGroup d-flex">
			<a class="btn" href="addCart">Add to Cart</a>
			<a class="btn" href="orderNow">Order Now</a>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>