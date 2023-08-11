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
								<div style="text-align: center; margin-top: 9px;">
									<a href="#" onclick="deleteCartItem(); return false;" style="box-sizing: border-box; display: inline-block; padding: 9px 17px 11px; border: 1px solid black; line-height: 1; text-align: center; text-decoration: none; white-space: nowrap;">삭제</a>
									<a href="#" onclick="orderCartItem(); return false;" style="box-sizing: border-box; display: inline-block; padding: 9px 17px 11px; border: 1px solid black; line-height: 1; text-align: center; text-decoration: none; white-space: nowrap;">주문</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- 총 주문 금액 -->
				<div id="totalPriceDiv" style="text-align: center; margin-top: 70px;  padding-top:15px; border-top: 1px solid; border-color: #666; margin-bottom: 15px;">
					<div>
						<span style="font-size: 1.3rem; font-weight: 700;">Total: KRW</span>
						<span style="font-size: 1.3rem; font-weight: 700;"></span>
					</div>
				</div>
				<div style="text-align: center; margin: 9px auto 0; display: flex; justify-content: center;">
					<a href="#" style="flex:1; display:flex; align-items:center; justify-content:center; background-color:#000; color:#fff; padding:12px 17px 15px;">
						주문
					</a>
				</div>
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