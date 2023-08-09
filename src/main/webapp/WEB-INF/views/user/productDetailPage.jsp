<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/productDetailPageStyle.css"/>

<div class="wrapper">
	<div class="productDetailContent d-flex flex-column align-items-center">
		<h2 id="productTitle">${product.productName}</h2>
		<img id="productImage" src="data:image/jpeg;base64, ${convertedImage}"/>
		<h3 id="productName">${product.productName}</h3>
		<table class="productDetailTable mb-3">
			<tr class="priceGroup">
				<th>Price</th>
				<td>
					<span>KRW</span>
					<span><fmt:formatNumber value="${product.productPrice}" pattern="#,###" /></span>
				</td>
			</tr>
			<tr class="discountedPriceGroup">
				<th>Discounted Price</th>
				<td>
					<span>KRW</span>
					<span id="discountedPrice"><fmt:formatNumber value="${discountedPrice}" pattern="#,###" /></span>
					<span>(KRW</span>
					<span id="discountAmount"><fmt:formatNumber value="${discountAmount}" pattern="#,###" /></span>
					<span>할인)</span>
				</td>
			</tr>
			<tr class="sizeGroup">
				<th>Size</th>
				<td>
					<select>
						<option>--옵션을 선택해주세요--</option>
						<option value="297 x 420mm">297 x 420mm</option>
						<option value="420 x 594mm">420 x 594mm</option>
						<option value="500 x 700mm">500 x 700mm</option>
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