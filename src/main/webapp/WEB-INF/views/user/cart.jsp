<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cartStyle.css"/>

<script>
	 var index = 0;
</script>
<div class="wrapper">
	<div id="container">
		<div id="contents">
			<div id="cart-body">
				<c:forEach var="cartItem" items="${cartItemList}" varStatus="status">
					<div id="${status.index}" style="border: none; margin-bottom: 30px">
						<div style="text-align: center;">
							<img class="cartItemImage" src="data:image/jpeg;base64, ${imageList[status.index]}">
							<div class="description">
								<a href="#" class="cartItemName">${productList[status.index].productName}</a>
								<ul class="cartItemInfo mt-2">
									<li class="mb-2">
										<span>Price: KRW </span>
										<span id="cartPrice${status.index}"><fmt:formatNumber value="${productList[status.index].productPrice * cartItem.cartProductQuantity}" pattern="#,###"/></span>
										<span>/</span>
										<span>
											<span>Discount: KRW -</span><span id="cartDiscountPrice${status.index}"><fmt:formatNumber value="${(productList[status.index].productPrice * cartItem.cartProductQuantity * productList[status.index].productDiscountRate).intValue()}" pattern="#,###"/></span>
										</span>
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
									<a href="javascript:void(0)" onclick='removeCartItem("${cartItem.customerId}", ${cartItem.productId}, ${cartItem.cartProductQuantity}, "${cartItem.optionSize}", "${cartItem.optionFrame}"); return false;' style="box-sizing: border-box; display: inline-block; padding: 9px 17px 11px; border: 1px solid black; line-height: 1; text-align: center; text-decoration: none; white-space: nowrap;">삭제</a>
									<a href="javascript:void(0)" onclick='orderCartItem(${status.index}, "${cartItem.customerId}", ${cartItem.productId}, "${cartItem.optionSize}", "${cartItem.optionFrame}"); return false;' style="box-sizing: border-box; display: inline-block; padding: 9px 17px 11px; border: 1px solid black; line-height: 1; text-align: center; text-decoration: none; white-space: nowrap;">주문</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- 총 주문 금액 -->
				<div id="totalPriceDiv" style="text-align: center; margin-top: 70px;  padding-top:15px; border-top: 1px solid; border-color: #666; margin-bottom: 15px;">
					<div>
						<span style="font-size: 1.3rem; font-weight: 700;">Total: KRW</span>
						<span id="totalPrice" style="font-size: 1.3rem; font-weight: 700;"><fmt:formatNumber value="${totalPrice}" pattern="#,###"/></span>
					</div>
				</div>
				<div style="text-align: center; margin: 9px auto 0; display: flex; justify-content: center;">
					<a href="javascript:void(0)" onclick='orderAllItems()'
						style="flex:1; display:flex; align-items:center; justify-content:center; background-color:#000; color:#fff; padding:12px 17px 15px;">
						주문
					</a>
				</div>
				<script>
					function minusQuantity(index, customerId, productId, optionSize, optionFrame) {
						let cartProductQuantity = $("#cartQuantity"+index).html();
						$.ajax({
							type: "POST",
							url: "/poster4j/cartMinusQuantity",
							data: {
								customerId: customerId,
								productId: productId,
								cartProductQuantity: cartProductQuantity,
								optionSize: optionSize,
								optionFrame: optionFrame
							},
							success: function(data) {
								$("#cartQuantity"+index).html(data.productQuantity);
								$("#cartPrice"+index).html(data.currentPrice);
								$("#cartDiscountPrice"+index).html(data.discountPrice);
								$("#totalPrice").html(data.totalPrice);
							}
						});
					}
					
					function plusQuantity(index, customerId, productId, optionSize, optionFrame) {
						let cartProductQuantity = $("#cartQuantity"+index).html();
						$.ajax({
							type: "POST",
							url: "/poster4j/cartPlusQuantity",
							data: {
								customerId: customerId,
								productId: productId,
								cartProductQuantity: cartProductQuantity,
								optionSize: optionSize,
								optionFrame: optionFrame
							},
							success: function(data) {
								$("#cartQuantity"+index).html(data.productQuantity);
								$("#cartPrice"+index).html(data.currentPrice);
								$("#cartDiscountPrice"+index).html(data.discountPrice);
								$("#totalPrice").html(data.totalPrice);
							}
						});
					}
					
					function removeCartItem(customerId, productId, cartProductQuantity, optionSize, optionFrame) {
						$.ajax({
							type: "POST",
							url: "/poster4j/removeCartItem",
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
					
					function orderCartItem(index, customerId, productId, optionSize, optionFrame) {
						let cartProductQuantity = $("#cartQuantity"+index).html();
						
						var form = document.createElement("form");
						form.setAttribute("charset", "UTF-8");
				        form.setAttribute("method", "Post");  //Post 방식
				        form.setAttribute("action", "/poster4j/order"); //요청 보낼 주소
				        
				        var hiddenField = document.createElement("input");
				        hiddenField.setAttribute("type", "hidden");
				        hiddenField.setAttribute("name", "orderItemList[0].customerId");
				        hiddenField.setAttribute("value", customerId);
				        form.appendChild(hiddenField);
				        
				        hiddenField = document.createElement("input");
				        hiddenField.setAttribute("type", "hidden");
				        hiddenField.setAttribute("name", "orderItemList[0].productId");
				        hiddenField.setAttribute("value", productId);
				        form.appendChild(hiddenField);
				        
				        hiddenField = document.createElement("input");
				        hiddenField.setAttribute("type", "hidden");
				        hiddenField.setAttribute("name", "orderItemList[0].productQuantity");
				        hiddenField.setAttribute("value", cartProductQuantity);
				        form.appendChild(hiddenField);
				        
				        hiddenField = document.createElement("input");
				        hiddenField.setAttribute("type", "hidden");
				        hiddenField.setAttribute("name", "orderItemList[0].productSize");
				        hiddenField.setAttribute("value", optionSize);
				        form.appendChild(hiddenField);
				        
				        hiddenField = document.createElement("input");
				        hiddenField.setAttribute("type", "hidden");
				        hiddenField.setAttribute("name", "orderItemList[0].productFrame");
				        hiddenField.setAttribute("value", optionFrame);
				        form.appendChild(hiddenField);
				        
				        document.body.appendChild(form);
						form.submit();
					}
					
					function orderAllItems() {
						$.ajax({
							type: "POST",
							url: "/poster4j/getAllCartItems",
							success: function(orderItem) {
								var form = document.createElement("form");
								form.setAttribute("charset", "UTF-8");
						        form.setAttribute("method", "Post");  //Post 방식
						        form.setAttribute("action", "/poster4j/order"); //요청 보낼 주소
								
						        var hiddenField;
						        
								for (let i=0; i<orderItem.orderItemList.length; ++i) {
									hiddenField = document.createElement("input");
									hiddenField.setAttribute("type", "hidden");
								    hiddenField.setAttribute("name", "orderItemList["+i+"].custormerId");
								    hiddenField.setAttribute("value", orderItem.orderItemList[i].customerId);
								    form.appendChild(hiddenField);
								    
								    hiddenField = document.createElement("input");
									hiddenField.setAttribute("type", "hidden");
								    hiddenField.setAttribute("name", "orderItemList["+i+"].productId");
								    hiddenField.setAttribute("value", orderItem.orderItemList[i].productId);
								    form.appendChild(hiddenField);
								    
								    hiddenField = document.createElement("input");
									hiddenField.setAttribute("type", "hidden");
								    hiddenField.setAttribute("name", "orderItemList["+i+"].productQuantity");
								    hiddenField.setAttribute("value", orderItem.orderItemList[i].productQuantity);
								    form.appendChild(hiddenField);
								    
								    hiddenField = document.createElement("input");
									hiddenField.setAttribute("type", "hidden");
								    hiddenField.setAttribute("name", "orderItemList["+i+"].productSize");
								    hiddenField.setAttribute("value", orderItem.orderItemList[i].productSize);
								    form.appendChild(hiddenField);
								    
								    hiddenField = document.createElement("input");
									hiddenField.setAttribute("type", "hidden");
								    hiddenField.setAttribute("name", "orderItemList["+i+"].productFrame");
								    hiddenField.setAttribute("value", orderItem.orderItemList[i].productFrame);
								    form.appendChild(hiddenField);
								}
						        
						        document.body.appendChild(form);
								form.submit();
							}
						});
					}
				</script>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>