<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div id="wrapper" style="margin: 0 auto; min-height: calc(100vh - 393px);">
	<div id="container" class="container-fluid" style="margin: 100px 0;  max-width: 100%;">
		 <div id="contents" class="row">
		 	<form class="d-flex flex-column" action="">
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
							<c:forEach var="order" items="${buyItemList}" varStatus="status">
								<c:forEach var="orderDetail" items="${order.orderDetail}" varStatus="detailStatus">
										<c:forEach var="product" items="${order.product}" varStatus="productStatus">
											<c:if test="${detailStatus.index==productStatus.index}">
												<tr class="">
													<td class="orderDate orderNo">${orderDetail.orderId}</td>
													<td class="productImage">
														<c:forEach var="productImage" items="${order.productImage}" varStatus="imageStatus">
															<c:if test="${productStatus.index==imageStatus.index}">
																<img alt="" src="data:image/jpeg;base64, ${productImage}" width="100%">
															</c:if>
														</c:forEach>
													</td>
										          	<td class="productInfo">${product.productName}</td>
													<td class="productQuantity">${orderDetail.orderDetailQuantity}</td>
										            <td class="purchasePrice"></td>
													<td class="orderStatus">${orderDetail.orderDetailStatus}</td>
													<td class="cancel Exchange re"></td>
												</tr>
											</c:if>
										</c:forEach>
								</c:forEach>
							</c:forEach>
							<%-- <c:forEach var="orderItem" items="${orderItemList}" varStatus="status">
							    <c:forEach var="orderDetail" items="${orderDetailList[status.index]}" varStatus="detailStatus">
							        <tr class="">
							            <td class="orderDate orderNo">${orderDetail.orderId}</td>
							            <td class="productImage"><img alt="" src="data:image/jpeg;base64, ${orderItem.productImageBase64}" width="100%"></td>
							            <td class="productInfo">${orderItem.productName}</td>
							            <td class="productQuantity">${orderDetail.orderDetailQuantity}</td>
							            <td class="purchasePrice"></td>
							            <td class="orderStatus">${orderDetail.orderDetailStatus}</td>
							            <td class="cancel Exchange re"></td>
							        </tr>
							    </c:forEach>
							</c:forEach> --%>
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
		 	</form>
		 </div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>