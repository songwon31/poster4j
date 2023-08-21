<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/canceledOrderLIstStyle.css">

<div class="order-list-wrapper">
	<h1 class="order-list-title">CANCELED ORDER</h1>
	<div class="order-list-items">
		<c:forEach var="canceledOrder" items="${canceledOrderList}" varStatus="status">
			<div class="order-item">
				<div class="date mt-3" >
					<div class="canceled-order-date">취소접수일: <span class="date-content">${canceledOrder.formattedCanceledOrderReqDate}</span></div>
					<div class="order-date">주문일: <span class="date-content">${orderList[status.index].convertedOrderDate}</span></div>
					<div class="order-no">주문번호: <span class="date-content">${canceledOrder.orderId}</span></div>
				</div>
				<div class="order-item-details d-flex container">
					<div class="productImage ml-3" style="width: 170px;"><img alt="" src="data:image/jpeg;base64, ${productImageList[status.index]}" width="100%"></div>
					<div class="ml-5" style="width:250px;">
						<div><span class="order-item-theme">[${productList[status.index].productTheme}]</span><br><span class="order-item-name mt-2">${productList[status.index].productName}</span> </div>
						<div class="mt-3">[옵션: ${canceledOrder.optionSize} / ${canceledOrder.optionFrame}]</div>
					</div>
					<div style="width:200px;">
						<div>수량:
							${orderDetailList[status.index].orderDetailQuantity}개</div>
						<div class="order-item-price mt-3">KRW <fmt:formatNumber value="${orderDetailList[status.index].orderDetailPrice}" pattern="#,###" /></div>
					</div>
					<c:if test="${canceledOrder.canceledOrderCategory.equals('반품')}">
						<div class="order-item-status" style="color: red; font-weight: bold;">${canceledOrder.canceledOrderCategory}</div>
					</c:if>
					<c:if test="${canceledOrder.canceledOrderCategory.equals('교환')}">
						<div class="order-item-status" style=" color: #ffcc00; font-weight: bold;">${canceledOrder.canceledOrderCategory}</div>
					</c:if>
					<c:if test="${canceledOrder.canceledOrderCategory.equals('발송 전 취소')}">
						<div class="order-item-status" style="">${canceledOrder.canceledOrderCategory}</div>
					</c:if>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="pagination">
	    <div class="text-center">
	        <div>
	            <a class="text-dark mr-2" href="canceledOrderList?pageNo=1" style="font-weight:600;">first</a>
	            <c:if test="${pager.groupNo>1}">
	                <a class="text-dark mr-2" href="canceledOrderList?pageNo=${pager.startPageNo-1}" style="font-weight:600;">prev</a>
	            </c:if>
	            <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
	                <c:if test="${pager.pageNo != i}">
	                    <a class="text-dark" href="canceledOrderList?pageNo=${i}" style="font-weight:600;">${i}</a>
	                </c:if>
	                <c:if test="${pager.pageNo == i}">
	                    <a class="text-dark" href="canceledOrderList?pageNo=${i}" style="font-weight:600;">${i}</a>
	                </c:if>
	            </c:forEach>
	            <c:if test="${pager.groupNo<pager.totalGroupNo}">
	                <a class="text-dark mr-2" href="canceledOrderList?pageNo=${pager.endPageNo+1}" style="font-weight:600;">next</a>
	            </c:if>
	            <a class="text-dark mr-2" href="canceledOrderList?pageNo=${pager.totalPageNo}" style="font-weight:600;">last</a>
	        </div>
	    </div>
	</div>
</div>


<%-- <div id="wrapper" style="margin: 0 auto; min-height: calc(100vh - 393px);">
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
</div> --%>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>