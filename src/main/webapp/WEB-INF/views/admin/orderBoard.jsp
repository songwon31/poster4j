<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="container-fluid flex-grow-1" style="margin-top:80px;">
	<div class="row">
		<div class="py-2 px-4">
			<div style="font-size: 20px">주문 목록</div>
			<div class="mt-1">
				<form class="form-inline justify-content-end" method="get" action="search">
					<div class="form-group">
						<label for="category"></label> 
						<select class="form-control-sm" id="category" name="category">
							<option value="orderId" selected>주문 번호</option>
							<option value="productId">상품 번호</option>
						</select>
					</div>
					<div class="form-group px-2">
						<label for="content"></label>
						<input type="text" class="form-control-sm" id="content" name="content"/>
					</div>
					<button type="submit" class="btn btn-success btn-sm">검색</button>
				</form>
			</div>
		</div>
		
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
				
				<c:forEach var="orderDetail" items="${orderDetailList}" varStatus="status">
					<tr>
						<td scope="row">${orderDetail.orderId}</td>
						<td>${orderDetail.productId}</td>
						<td>${orderDetail.orderDetailQuantity}</td>
						<td>${orderDetailPriceList[status.index].intValue()}</td>
						<td><fmt:formatDate value="${orderDateList[status.index]}" pattern="yyyy-MM-dd"/></td>
						<td>${orderDetail.orderDetailStatus}</td>
					</tr>
				</c:forEach>
				
			</thead>
		</table>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>