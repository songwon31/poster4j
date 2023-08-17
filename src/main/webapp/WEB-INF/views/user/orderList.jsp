<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script>
	 $(init);
	 
	 function init(){
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


<div id="wrapper" style="margin: 0 auto; min-height: calc(100vh - 393px);">
	<div id="container" class="container-fluid" style="margin: 100px 0;  max-width: 100%;">
		 <div id="contents" class="row">
		 	<div class="d-flex flex-column" action="">
		 		<div style="text-align: center;">
		 			<select class="m-2" style="border: 0; border-bottom: 1px solid;">
		 				<option>전체 주문처리상태</option>
		 				<option value="입금전">입금전</option>
		 				<option value="배송준비중">배송준비중</option>
		 				<option value="배송중">배송중</option>
		 				<option value="배송완료">배송완료</option>
		 				<option value="취소">취소</option>
		 				<option value="교환">교환</option>
		 				<option value="반품">반품</option>
		 			</select>
		 		</div>
		 		<div id="period" class="text-center">
		 			<span><a href="#" class="btn">Today</a></span>
		 			<span><a href="#" class="btn">Week</a></span>
		 			<span><a href="#" class="btn">Month</a></span>
		 			<span><a href="#" class="btn">3 Month</a></span>
		 		</div>
		 		<div class="container-fluid table-responsive mt-3" style="width: 100%">
			 		<table border="1" style="width: 100%">
			 			<colgroup>
							<col style="width:135px;">
							<col style="width:93px;">
							<col style="width:400px;">
							<col style="width:61px;">
							<col style="width:111px;">
							<col style="width:111px;">
							<col style="width:111px;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">주문일자<br>[주문번호]</th>
						        <th scope="col">이미지</th>
						        <th scope="col">상품정보</th>
						        <th scope="col">수량</th>
						        <th scope="col">상품구매금액</th>
						        <th scope="col">주문처리상태</th>
						        <th scope="col">취소/교환/반품</th>
							</tr>
						</thead>
						<tbody class="center displaynone">
							<c:forEach var="buyItem" items="${buyItemList}" varStatus="status">
								<c:forEach var="orderDetail" items="${buyItem.orderDetail}" varStatus="detailStatus">
									<c:forEach var="product" items="${buyItem.product}" varStatus="productStatus">
										<c:if test="${detailStatus.index==productStatus.index}">
											<c:forEach var="productImage" items="${buyItem.productImage}" varStatus="imageStatus">
												<c:if test="${productStatus.index==imageStatus.index}">
													<tr class="">
														<form id="form" method="get" action="writeReview">
															<input type= hidden name="orderId" value="${orderDetail.orderId}">
															<input type= hidden name="productId" value="${orderDetail.productId}">
															<input type= hidden name="productName" value="${product.productName}">
															<input type= hidden name="productTheme" value="${product.productTheme}">
															<input type= hidden name="optionSize" value="${orderDetail.optionSize}">
															<input type= hidden name="optionFrame" value="${orderDetail.optionFrame}">
															
															<td class="orderDate orderNo">
																<span class="convertedOrderDate">${buyItem.order.convertedOrderDate}</span><br>[${orderDetail.orderId}]
															</td>
															<td class="productImage">
																<img alt="" src="data:image/jpeg;base64, ${productImage}" width="100%">
															</td>
												          	<td class="productInfo">[${product.productTheme}]${product.productName}<br>[옵션:${orderDetail.optionSize}/${orderDetail.optionFrame}]</td>
															<td class="productQuantity">${orderDetail.orderDetailQuantity}</td>
												            <td class="purchasePrice">${orderDetail.orderDetailPrice}</td>
															<td class="orderStatus">${orderDetail.orderDetailStatus}</td>
															<td class="cancel Exchange re">
																<a href="javascript:void(0)" class="btn btn-dark" onclick = "cancelOrder(${orderDetail.orderId}, ${orderDetail.productId}, '${orderDetail.optionSize}', '${orderDetail.optionFrame}')">취소</a><br>
																<button id="writeReviewBtn" type="submit" class="writeReview btn btn-light" style="border: 1px solid">리뷰 작성</button>
																<a id="updateReviewBtn" href="updateReview?orderId=${orderDetail.orderId}&productId=${orderDetail.productId}&optionSize=${orderDetail.optionSize}&optionFrame=${orderDetail.optionFrame}" class="updateReview btn btn-light" style="border: 1px solid">리뷰 수정</a>
															</td>
														</form>
													</tr>
												</c:if>
											</c:forEach>
										</c:if>
									</c:forEach>
								</c:forEach>
							</c:forEach>
							<tr>
								<td colspan="12" class="text-center">
									<div>
										<a class="btn btn-outline-primary btn-sm" href="orderList?pageNo=1">처음</a>
										<c:if test="${pager.groupNo>1}">
											<a class="btn btn-outline-info btn-sm" href="orderList?pageNo=${pager.startPageNo-1}">이전</a>
										</c:if>
								
										<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
											<c:if test="${pager.pageNo != i}">
												<a class="btn btn-outline-success btn-sm" href="orderList?pageNo=${i}">${i}</a>
											</c:if>
											<c:if test="${pager.pageNo == i}">
												<a class="btn btn-danger btn-sm" href="orderList?pageNo=${i}">${i}</a>
											</c:if>
										</c:forEach>
								
										<c:if test="${pager.groupNo<pager.totalGroupNo}">
											<a class="btn btn-outline-info btn-sm" href="orderList?pageNo=${pager.endPageNo+1}">다음</a>
										</c:if>
										<a class="btn btn-outline-primary btn-sm" href="orderList?pageNo=${pager.totalPageNo}">맨끝</a>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
		 		</div>
		 	</div>
		 </div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>