<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderListStyle.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap">
 
<div id="wrapper" class="order-list-wrapper">
	<div id="container" class="container">
		<div id="contents">
			<h1 class="order-list-title">ORDER</h1>
			<div class="order-list-filter">
				<select class="order-status-filter">
					<option>전체 주문처리상태</option>
					<option value="입금전">입금전</option>
					<option value="배송준비중">배송준비중</option>
					<option value="배송중">배송중</option>
	 				<option value="배송완료">배송완료</option>
	 				<option value="취소">취소</option>
	 				<option value="교환">교환</option>
	 				<option value="반품">반품</option>
				</select>
				<div class="order-period-filter">
					<a href="#" class="period-link">Today</a>
					<a href="#" class="period-link">Week</a>
					<a href="#" class="period-link">Month</a>
					<a href="#" class="period-link">3 Month</a>
				</div>
			</div>
			<div class="order-list-items">
				<c:forEach var="buyItem" items="${buyItemList}" varStatus="status">
					<div class="order-item">
						<div class="order-date">
							${buyItem.order.convertedOrderDate} 주문 <span>Order_No.${buyItem.order.orderId}</span>
						</div>
						<c:forEach var="orderDetail" items="${buyItem.orderDetail}" varStatus="detailStatus">
							<c:forEach var="product" items="${buyItem.product}" varStatus="productStatus">
								<c:if test="${detailStatus.index==productStatus.index}">
									<c:forEach var="productImage" items="${buyItem.productImage}" varStatus="imageStatus">
										<c:if test="${productStatus.index==imageStatus.index}">
												<div class="">
													<form id="form" method="get" action="writeReview">
														<input type= hidden name="orderId" value="${orderDetail.orderId}">
														<input type= hidden name="productId" value="${orderDetail.productId}">
														<input type= hidden name="productName" value="${product.productName}">
														<input type= hidden name="productTheme" value="${product.productTheme}">
														<input type= hidden name="optionSize" value="${orderDetail.optionSize}">
														<input type= hidden name="optionFrame" value="${orderDetail.optionFrame}">
														<input type= hidden name="orderDetailStatus" value="${orderDetail.orderDetailStatus}">
														<div class="d-flex row my-4 mx-2 p-3 justify-content-center">
															<div class="productImage justify-content-center" style="width: 170px; height: auto">
																<a href="productDetail?productId=${orderDetail.productId}"><img class="orderProductImage" alt="" src="data:image/jpeg;base64, ${productImage}" width="100%" height="100%"></a>
															</div>
															<div class="mx-5 py-4"  style="width: 300px; display: flex; flex-direction: column; justify-content: space-between;">
																<div>
													          		<div class="order-item-title"><span style="font-size: 20px">[${product.productTheme}]</span><br>${product.productName}<br><span>[옵션: ${orderDetail.optionSize} / ${orderDetail.optionFrame}]</span></div>
																</div>
																<div>
																	<div class="order-item-quantity">수량: ${orderDetail.orderDetailQuantity}개</div>
													            	<div class="order-item-price mt-2">KRW <fmt:formatNumber value="${orderDetail.orderDetailPrice}" pattern="#,###" /> </div>
																	<div class="order-item-status">${orderDetail.orderDetailStatus}</div>
																</div>
															</div>
															<div class="button" style="max-width: 200px; display: flex; flex-direction: column; justify-content: space-between;">
														    	<div>
														    		<c:if test="${orderDetail.hasReview == false}">
														    			<c:if test="${orderDetail.orderDetailStatus.equals('배송완료')}">
																	    	<div style="margin-top: 50px;">
																		        <button id="writeReviewBtn" type="submit" class="writeReview btn my-2" style="border: 1px solid;">리뷰 작성</button>
																	    	</div>
														    			</c:if>
														    		</c:if>
														    		<c:if test="${orderDetail.hasReview == true}">
																    	<div>
																	        <a id="updateReviewBtn" href="updateReview?orderId=${orderDetail.orderId}&productId=${orderDetail.productId}&optionSize=${orderDetail.optionSize}&optionFrame=${orderDetail.optionFrame}" class="updateReview btn my-2" style="border: 1px solid">리뷰 수정</a>
																    	</div>
																    	<div>
																	        <a id="deleteReviewBtn" href="deleteReview?orderId=${orderDetail.orderId}&productId=${orderDetail.productId}&optionSize=${orderDetail.optionSize}&optionFrame=${orderDetail.optionFrame}" class="updateReview btn my-2" style="border: 1px solid">리뷰 삭제</a>
																    	</div>
														    		</c:if>
														    	</div>
														    	<div style="width:150px">
															        <a href="javascript:void(0)" class="btn btn-dark my-2 px-3" onclick="cancelOrder(${orderDetail.orderId}, ${orderDetail.productId}, '${orderDetail.optionSize}', '${orderDetail.optionFrame}')" style="width:100%">취소</a>
														    	</div>
															</div>
														</div>
													</form>
												</div>
										</c:if>
									</c:forEach>
								</c:if>
							</c:forEach>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
			<div class="pagination">
				<div class="text-center">
					<div>
						<a class="text-dark mr-2" href="orderList?pageNo=1" style="font-weight:600;">first</a>
						<c:if test="${pager.groupNo>1}">
							<a class="text-dark mr-2" href="orderList?pageNo=${pager.startPageNo-1}" style="font-weight:600;">prev</a>
						</c:if>
						<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
							<c:if test="${pager.pageNo != i}">
								<a class="text-dark" href="orderList?pageNo=${i}" style="font-weight:600;">${i}</a>
							</c:if>
							<c:if test="${pager.pageNo == i}">
								<a class="text-dark" href="orderList?pageNo=${i}" style="font-weight:600;">${i}</a>
							</c:if>
						</c:forEach>
						<c:if test="${pager.groupNo<pager.totalGroupNo}">
							<a class="text-dark mr-2" href="orderList?pageNo=${pager.endPageNo+1}" style="font-weight:600;">next</a>
						</c:if>
						<a class="text-dark mr-2" href="orderList?pageNo=${pager.totalPageNo}" style="font-weight:600;">last</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	 $(init);
	 
	 function init(){
		 $(".order-status-filter").change(function(){
			var selectedStatus = $(this).val();
			updateOrderItems(selectedStatus);
		 });
	 }
	 
	function updateOrderItems(selectedStatus){
		$.ajax({
		 url: "updateOrderList",
		 type: "GET",
		 data: {
			 selectedStatus: selectedStatus
		 },
		 success:function(data){
			  $(".order-list-items").html(data);
		 },
		error: function() {
			alert("주문 값 업데이트에 실패했습니다.");
		   }
		})
	}
	
	function cancelOrder(orderId, productId, optionSize, optionFrame) {
		var popupWidth = 600;
		var popupHeight = 300;
		var popupX = (window.screen.width/2) - (popupWidth/2);
		var popupY= (window.screen.height/2) - (popupHeight/2);
		
		let options = "toolbar=no,scrollbars=no,location=no,resizable=yes,status=no,menubar=no,height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY";
		window.open("userCancelOrderForm?orderId="+orderId+"&productId="+productId+"&optionSize="+optionSize+"&optionFrame="+optionFrame, "_blank", "toolbar=no,scrollbars=no,location=no,resizable=yes,status=no,menubar=no,height="+popupHeight+", width="+popupWidth+", left="+popupX+", top="+popupY);
	}
 
</script>
 
<%@ include file="/WEB-INF/views/common/footer.jsp" %>