<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="container-fluid flex-grow-1">
	<div class="row">
		<div class="py-2 px-4" style="font-size:20;">주문 목록</div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">주문 번호</th>
					<th scope="col">상품</th>
					<th scope="col">수량</th>
					<th scope="col">금액</th>
					<th scope="col">주문 날짜</th>
					<th scope="col">상태</th>
				</tr>
				
				<c:forEach var="orderDetail" items="${orderDetails}" varStatus="status">
					<tr>
						<td scope="row">${orderDetail.orderId}</td>
						<td>${orderDetail.productId}</td>
						<td>${orderDetail.orderDetailQuantity}</td>
						<td>1</td>
						<td>1</td>
						<%-- <td><fmt:formatDate value="${order_dates[status.index]}" pattern="yyyy-MM-dd"/></td> --%>
						<td>${orderDetail.orderDetailStatus}</td>
					</tr>
				</c:forEach>
				
			</thead>
		</table>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>