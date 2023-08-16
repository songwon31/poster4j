<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cartStyle.css"/>

<script>
	function changeQuantity(index, customerId, productId, optionSize, optionFrame) {
		let cartProductQuantity = $("#cartItemQuantity"+index).val();
		$.ajax({
			type: "POST",
			url: "/poster4j/cartChangeQuantity",
			data: {
				customerId: customerId,
				productId: productId,
				cartProductQuantity: cartProductQuantity,
				optionSize: optionSize,
				optionFrame: optionFrame
			},
			success: function(data) {
				$("#cartItemQuantity"+index).html(data.productQuantity);
				$("#cartPrice"+index).html(data.currentPrice);
				$("#originalCartPrice"+index).html(data.currentPrice);
				$("#discountedCartPrice"+index).html(data.discountedPrice);
				$("#originalTotalPrice").html(data.originalTotalPrice);
				$("#shippingFee").html(data.shippingFee);
				$("#finalTotalPrice").html(data.finalTotalPrice);
				if (data.shippingFee == "무료") {
					$("#won").css("display", "none");
				} else {
					$("#won").css("display", "inline");
				}
			}
		});
	}
	
	function removeCartItem(customerId, productId, optionSize, optionFrame) {
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

<div class="wrapper">
	<section class="contents-cart">
		<section class="cart-title">
			<div style="font-size:25px; font-weight: bold;">CART</div>
		</section>
		<div id="cartContent">
			<table class="cartTable">
				<colgroup>
					<col width="50">
					<col width="80">
					<col width="*">
					<col width="90">
				</colgroup>
				<thead>
		            <tr class="table-head">
		                <th scope="col">
		                	<label style="margin: 0px;">
		                		<input title="모든 상품을 결제상품으로 설정" type="checkbox" class="all-deal-select">
		                		<span style="position:absolute; font-weight:bold;">&nbsp;&nbsp;전체선택</span>
		                	</label>
		                </th>
		                <th scope="colgroup" colspan="2" style="font-weight:bold;">상품정보</th>
		                <th scope="col" style="font-weight:bold;">상품금액</th>
		            </tr>
	            </thead>
	            <tbody class="table-body">
	            	<c:forEach var="cartItem" items="${cartItemList}" varStatus="status">
	            		<tr class="cart-deal-item" style="position: relative;">
	            			<td class="product-select">
	            				<input id="checkbox${status.index}" type="checkbox" checked="checked">
	            			</td>
	            			<td class="product-image">
	            				<img style="width:78px; height:78px; aspect-ratio: auto 78 / 78; vertical-align: top;" src="data:image/jpeg;base64, ${imageList[status.index]}">
	            			</td>
	            			<td class="product-box">
	            				<div class="product-name-part">
	            					<a style="text-decoration: none; margin-right: 5px; font-weight: 500; font-size: 16px; line-height: 22px; color: #000;">
	            						${productList[status.index].productName}
	            					</a>
	            				</div>
	            				<div class="item-detail-part">
	            					<div class="option-item-part">
	            						<span>[옵션: </span>
										<span>${cartItem.optionSize}</span>
										<span>/</span>
										<span>${cartItem.optionFrame}]</span>
	            					</div>
	            					<div class="option-price-part" style="font-size:0px;">
	            						<span class="mr-3"><fmt:formatNumber value="${productList[status.index].productPrice}" pattern="#,###"/>원</span>
	            						<span class="mr-1"><input id="cartItemQuantity${status.index}" style="width:40px; border: 1px solid #ccc; padding: 2px 5px 2px 5px; height: 18px; font-size: 12px;" type="text" value="${cartItem.cartProductQuantity}"></span>
	            						<span class="mr-2">
	            							<a style="font-size:10px; padding:1.5px 1.5px; border:1px solid #787878; text-decoration:none; color:#787878;" 
	            								href="javascript:void(0)" onclick='changeQuantity(${status.index}, "${cartItem.customerId}", ${cartItem.productId}, "${cartItem.optionSize}", "${cartItem.optionFrame}"); return false;'>수량변경</a>
	            						</span>
	            						<span id="cartPrice${status.index}"><fmt:formatNumber value="${productList[status.index].productPrice * cartItem.cartProductQuantity}" pattern="#,###"/>원</span>
	            						<span class="ml-2 mr-2">
	            							<a style="font-size:10px; padding:1.5px 1.5px; border:1px solid #FF6464; text-decoration:none; color:#FF6464;" 
	            								href="javascript:void(0)" onclick='removeCartItem(${status.index}, "${cartItem.customerId}", ${cartItem.productId}, "${cartItem.optionSize}", "${cartItem.optionFrame}"); return false;'>삭제</a>
	            						</span>
	            					</div>
	            				</div>
	            			</td>
	            			<td class="item-total-price">
	            				<c:if test="${productList[status.index].productDiscountRate > 0}">
	            					<div id="originalCartPrice${status.index}" style="text-decoration:line-through; color:black;"><fmt:formatNumber value="${productList[status.index].productPrice * cartItem.cartProductQuantity}" pattern="#,###"/>원</div>
	            					<div id="discountedCartPrice${status.index}" style="color:black;"><fmt:formatNumber value="${(productList[status.index].productPrice * (1.0 - productList[status.index].productDiscountRate) * cartItem.cartProductQuantity).intValue()}" pattern="#,###"/>원</div>
	            				</c:if>
	            				<c:if test="${productList[status.index].productDiscountRate == 0}">
	            					<div id="originalCartPrice${status.index}" style="color:black;"><fmt:formatNumber value="${productList[status.index].productPrice * cartItem.cartProductQuantity}" pattern="#,###"/>원</div>
	            				</c:if>
	            			</td>
	            		</tr>
	            	</c:forEach>
	            	<tr class="bundle-price-total">
	            		<td colspan="5" style="border-bottom: 1px solid #ddd; position: relative; padding: 20px 35px 16px 0; background: #f7f7f7; font-size: 12px; line-height: 29px; text-align: right;">
	            			<span class="total-price-area" style="font-size: 11px;">
	            				<span>상품가격</span>
	            				<span id="originalTotalPrice" style="font-size:14px; font-weight:550;">${originalTotalPrice}</span><span>원</span>
	            				<span style="font-size:14px; font-weight:550;">+</span>
	            				<span>배송비</span>
	            				<span id="shippingFee" style="font-size:14px; font-weight:550;">${shippingFee}</span><c:if test='${shippingFee.equals("3,000")}'><span id="won">원</span></c:if><c:if test='${shippingFee.equals("무료")}'><span id="won" style="display:none;">원</span></c:if>
	            				<span style="font-size:14px; font-weight:550;">=</span>
	            				<span>주문금액</span>
	            				<span id="finalTotalPrice" style="font-size:15px; font-weight:600;">${finalTotalPrice}</span><span>원</span>
	            			</span>
	            		</td>
	            	</tr>
	            </tbody>
			</table>
			<div class="order-table-foot">
				<span class="d-flex flex-row align-items-center" style="float: left; margin-left: 15px; font-size: 12px; cursor: pointer;">
					<label class="d-flex flex-row align-items-center" style="position:relative; top: 2px;">
						<input style="font-size:12px; margin-right:3px;" type="checkbox" checked="checked">
						<span style="font-size:12px;">전체선택</span><span style="font-size:12px;" class="cart-count-bottom">( <em>2</em> / 2 )</span>
					</label>
					<a class="btn btn-sm ml-2" style="border: 1px solid #ccc;" href="javascript:void(0)" onclick="">전체삭제</a>
				</span>
			</div>
			<div style="margin-top: 20px; text-align: center; position: relative;">
				<a href="${pageContext.request.contextPath}/" class="keepShoppingBtn" style="text-decoration:none; color:black;">계속 쇼핑하기</a>
				<a href="javascript:void(0)" onclick="orderAllItems();" class="goPaymentBtn" style="text-decoration:none; color:white;">구매하기</a>
			</div>
		</div>
	</section>
	<!-- 모바일
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
									<a href="javascript:void(0)" onclick='removeCartItem("${cartItem.customerId}", ${cartItem.productId}, "${cartItem.optionSize}", "${cartItem.optionFrame}"); return false;' style="box-sizing: border-box; display: inline-block; padding: 9px 17px 11px; border: 1px solid black; line-height: 1; text-align: center; text-decoration: none; white-space: nowrap;">삭제</a>
									<a href="javascript:void(0)" onclick='orderCartItem(${status.index}, "${cartItem.customerId}", ${cartItem.productId}, "${cartItem.optionSize}", "${cartItem.optionFrame}"); return false;' style="box-sizing: border-box; display: inline-block; padding: 9px 17px 11px; border: 1px solid black; line-height: 1; text-align: center; text-decoration: none; white-space: nowrap;">주문</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<div id="totalPriceDiv" style="text-align: center; margin-top: 70px;  padding-top:15px; border-top: 1px solid; border-color: #666; margin-bottom: 15px;">
					<div>
						<span style="font-size: 1.3rem; font-weight: 700;">Total: KRW</span>
						<span id="totalPrice" style="font-size: 1.3rem; font-weight: 700; padding: 0; border:none;"><fmt:formatNumber value="${totalPrice}" pattern="#,###"/></span>
					</div>
				</div>
				<div style="text-align: center; margin: 9px auto 0; display: flex; justify-content: center;">
					<a href="javascript:void(0)" onclick='orderAllItems()'
						style="flex:1; display:flex; align-items:center; justify-content:center; background-color:#000; color:#fff; padding:12px 17px 15px;">
						주문
					</a>
				</div>
			</div>
		</div>
	</div>
	-->
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>