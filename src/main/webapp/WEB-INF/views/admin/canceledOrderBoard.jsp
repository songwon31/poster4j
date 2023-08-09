<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="container-fluid flex-grow-1" style="margin-top:80px;">
	<div class="col">
		<div class="py-2 px-4">
			<div style="font-size: 20px">취소/교환/반품/환불 관리</div>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col"><span class="d-flex justify-content-center">주문ID</span></th>
					<th scope="col"><span class="d-flex justify-content-center">상품ID</span></th>
					<th scope="col"><span class="d-flex justify-content-center">카테고리</span></th>
					<th scope="col"><span class="d-flex justify-content-center">사유</span></th>
					<th scope="col"><span class="d-flex justify-content-center">접수 날짜</span></th>
					<th scope="col"><span class="d-flex justify-content-center">처리</span></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="canceledOrder" items="${canceledOrderList}" varStatus="status">
					<tr>
						<td class="align-middle" scope="row" style="width:10px;"><span class="d-flex justify-content-center">${canceledOrder.orderId}</span></td>
						<td class="align-middle" style="width:10px;"><span class="d-flex justify-content-center">${canceledOrder.productId}</span></td>
						<c:if test='${canceledOrder.canceledOrderCategory == "cancelBeforeSend"}'>
							<td class="align-middle" style="width:30px;"><span class="d-flex justify-content-center">취소</span></td>
						</c:if>
						<c:if test='${canceledOrder.canceledOrderCategory == "exchange"}'>
							<td class="align-middle" style="width:30px;"><span class="d-flex justify-content-center">교환</span></td>
						</c:if>
						<c:if test='${canceledOrder.canceledOrderCategory == "return"}'>
							<td class="align-middle" style="width:30px;"><span class="d-flex justify-content-center">반품</span></td>
						</c:if>
						<td class="align-middle" style="width:50px;"><span class="d-flex justify-content-center">${canceledOrder.canceledOrderReason}</span></td>
						<td class="align-middle" style="width:30px;"><span class="d-flex justify-content-center"><fmt:formatDate value="${canceledOrder.canceledOrderReqDate}" pattern="yyyy-MM-dd"/></span></td>
						
					</tr>
				</c:forEach>
				<tr>
					<td colspan="12" class="text-center">
						<div>
							<a class="btn btn-outline-primary btn-sm" href="orderInquiryBoard?pageNo=1">처음</a>
							<c:if test="${pager.groupNo>1}">
								<a class="btn btn-outline-info btn-sm" href="orderInquiryBoard?pageNo=${pager.startPageNo-1}">이전</a>
							</c:if>
							
							<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
								<c:if test="${pager.pageNo != i}">
									<a class="btn btn-outline-success btn-sm" href="orderInquiryBoard?pageNo=${i}">${i}</a>
								</c:if>
								<c:if test="${pager.pageNo == i}">
									<a class="btn btn-danger btn-sm" href="orderInquiryBoard?pageNo=${i}">${i}</a>
								</c:if>
							</c:forEach>
							
							<c:if test="${pager.groupNo<pager.totalGroupNo}">
								<a class="btn btn-outline-info btn-sm" href="orderInquiryBoard?pageNo=${pager.endPageNo+1}">다음</a>
							</c:if>
							<a class="btn btn-outline-primary btn-sm" href="orderInquiryBoard?pageNo==${pager.totalPageNo}">맨끝</a>
						</div>
					</td>
				</tr>
			
			</tbody>
		</table>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>