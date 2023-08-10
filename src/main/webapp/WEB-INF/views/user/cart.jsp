<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cartStyle.css"/>

<div class="wrapper">
	<div id="container">
		<div id="contents">
			<div id="cart-body">
				<c:forEach var="cartItem" items="${cartItemList}" varStatus="status">
					<div style="border: none; margin-bottom: 30px">
						<div style="text-align: center;">
							<img class="cartItemImage" src="data:image/jpeg;base64, ${imageList[status.index]}">
							<div class="description">
								<a href="#" class="cartItemName">${productList[status.index].productName}</a>
								<ul class="cartItemInfo mt-2">
									<li class="mb-2">
										<span>Price: KRW </span>
										<span id="cartPrice${status.index}"><fmt:formatNumber value="${productList[status.index].productPrice * cartItem.cartProductQuantity}" pattern="#,###"/></span>
										<span>/</span>
										<span id="cartDiscountPrice${status.index}">Discount: KRW -</span><span><fmt:formatNumber value="${(productList[status.index].productPrice * cartItem.cartProductQuantity * productList[status.index].productDiscountRate).intValue()}" pattern="#,###"/></span>
										<span>/</span>
									</li>
									
									<li class="mb-2">
										<span>[옵션: </span>
										<span>${cartItem.optionSize}</span>
										<span>/</span>
										<span>${cartItem.optionFrame}]</span>
									</li>
									
									<li class="mb-2">
										<span><a href="javascript:void(0)" onclick='minusQuantity(${status.index}, "${cartItem.customerId}", ${cartItem.productId}, "${cartItem.optionSize}", "${cartItem.optionFrame}"); return false;'>-</a></span>
										<span id="cartQuantity${status.index}" class="mx-3">${cartItem.cartProductQuantity}</span>
										<span><a href="javascript:void(0)" onclick='plusQuantity(${status.index}, "${cartItem.customerId}", ${cartItem.productId}, "${cartItem.optionSize}", "${cartItem.optionFrame}"); return false;'>+</a></span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</c:forEach>
				<script>
					function minusQuantity(index, customerId, productId, optionSize, optionFrame) {
						console.log(customerId);
						console.log(productId);
						$.ajax({
							type: "POST",
							url: "/poster4j/cartMinusQuantity",
							data: {
								customerId: customerId,
								productId: productId,
								optionSize: optionSize,
								optionFrame: optionFrame
							},
							success: function(data) {
								document.location.reload();
							}
						});
					}
					
					function plusQuantity(index, customerId, productId, optionSize, optionFrame) {
						console.log(customerId);
						console.log(productId);
						$.ajax({
							type: "POST",
							url: "/poster4j/cartPlusQuantity",
							data: {
								customerId: customerId,
								productId: productId,
								optionSize: optionSize,
								optionFrame: optionFrame
							},
							success: function(data) {
								document.location.reload();
							}
						});
					}
				</script>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>