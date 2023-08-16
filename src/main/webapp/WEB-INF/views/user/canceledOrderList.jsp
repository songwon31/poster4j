<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div id="wrapper" style="margin: 0 auto; min-height: calc(100vh - 393px);">
	<div id="container" class="container-fluid" style="margin: 100px 0;  max-width: 100%;">
		 <div id="contents" class="row">
		 	<div class="d-flex flex-column" action="">
		 		<div class="container-fluid table-responsive mt-3" style="width: 100%">
			 		<table border="1" style="width: 100%">
			 			<colgroup>
							<col style="width:135px;">
							<col style="width:135px;">
							<col style="width:400px;">
							<col style="width:61px;">
							<col style="width:111px;">
							<col style="width:111px;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">취소요청일자<br></th>
						        <th scope="col">주문일자<br>[주문번호]</th>
						        <th scope="col">상품정보</th>
						        <th scope="col">수량</th>
						        <th scope="col">상품구매금액</th>
						        <th scope="col">취소 종류</th>
							</tr>
						</thead>
						<tbody class="center displaynone">
							<c:catch var="exception">
							<c:forEach var="canceledOrder" items="${canceledOrderList}" varStatus="status">
								<tr>
									<td>${canceledOrder.canceledOrderReqDate}</td>
									<td>${orderList[status.index].orderDate}</td>
									<td>${canceledOrder.optionSize}[${canceledOrder.optionFrame}]</td>
									<td>${orderDetailList[status.index].orderDetailQuantity}</td>
									<td>${orderDetailList[status.index].orderDetailPrice}</td>
									<td>${canceledOrder.canceledOrderCategory}</td>
								</tr>
							</c:forEach>
							</c:catch>
							<c:if test="${exception != null}">
    							An error occurred: ${exception.message}
    						</c:if>
							<tr>
								<td colspan="12" class="text-center">
									<div>
										<a class="btn btn-outline-primary btn-sm" href="canceledOrderList?pageNo=1">처음</a>
										<c:if test="${pager.groupNo>1}">
											<a class="btn btn-outline-info btn-sm" href="canceledOrderList?pageNo=${pager.startPageNo-1}">이전</a>
										</c:if>
								
										<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
											<c:if test="${pager.pageNo != i}">
												<a class="btn btn-outline-success btn-sm" href="canceledOrderList?pageNo=${i}">${i}</a>
											</c:if>
											<c:if test="${pager.pageNo == i}">
												<a class="btn btn-danger btn-sm" href="canceledOrderList?pageNo=${i}">${i}</a>
											</c:if>
										</c:forEach>
								
										<c:if test="${pager.groupNo<pager.totalGroupNo}">
											<a class="btn btn-outline-info btn-sm" href="canceledOrderList?pageNo=${pager.endPageNo+1}">다음</a>
										</c:if>
										<a class="btn btn-outline-primary btn-sm" href="canceledOrderList?pageNo=${pager.totalPageNo}">맨끝</a>
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