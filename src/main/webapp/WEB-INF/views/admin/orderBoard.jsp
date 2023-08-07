<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="container-fluid flex-grow-1" style="margin-top:80px;">
	<div class="col">
		<div class="py-2 px-4">
			<div style="font-size: 20px">주문 목록</div>
			<div class="mt-1">
				<form class="form-inline" method="get" action="orderBoard">
					<div class="form-group">
						<label for="category"></label> 
						<select class="form-control-sm" id="category" name="category">
							<option value="">선택하세요</option>
							<c:if test='${orderDetailSearchCategory == "orderId"}'><option value="orderId" selected>주문 번호</option></c:if>
							<c:if test='${orderDetailSearchCategory != "orderId"}'><option value="orderId">주문 번호</option></c:if>
							<c:if test='${orderDetailSearchCategory == "productId"}'><option value="productId" selected>상품 번호</option></c:if>
							<c:if test='${orderDetailSearchCategory != "productId"}'><option value="productId">상품 번호</option></c:if>
						</select>
					</div>
					<div class="form-group px-2">
						<label for="content"></label>
						<input type="text" class="form-control-sm" id="content" name="content" value="${orderDetailSearchContent}"/>
					</div>
					<button type="submit" class="btn btn-success btn-sm">검색</button>
				</form>
			</div>
		</div>
		
		<table class="table">
			<thead>
				<tr>
					<th scope="col"><span class="d-flex justify-content-center">주문 번호</span></th>
					<th scope="col"><span class="d-flex justify-content-center">상품</span></th>
					<th scope="col"><span class="d-flex justify-content-center">수량</span></th>
					<th scope="col"><span class="d-flex justify-content-center">금액</span></th>
					<th scope="col"><span class="d-flex justify-content-center">주문 날짜</span></th>
					<th scope="col"><span class="d-flex justify-content-center">상태</span></th>
					<th scope="col"><span class="d-flex justify-content-center">주문 취소</span>
				</tr>
			</thead>
			<tbody>	
				<c:forEach var="orderDetail" items="${orderDetailList}" varStatus="status">
					<tr>
						<td class="align-middle" scope="row" style="width:30px;"><span class="d-flex justify-content-center">${orderDetail.orderId}</span></td>
						<td class="align-middle" style="width:30px;"><span class="d-flex justify-content-center">${orderDetail.productId}</span></td>
						<td class="align-middle" style="width:30px;"><span class="d-flex justify-content-center align-self-center">${orderDetail.orderDetailQuantity}</span></td>
						<td class="align-middle" style="width:30px;"><span class="d-flex justify-content-center align-self-center">${orderDetailPriceList[status.index].intValue()}</span></td>
						<td class="align-middle" style="width:30px;"><span class="d-flex justify-content-center align-self-center"><fmt:formatDate value="${orderDateList[status.index]}" pattern="yyyy-MM-dd"/></span></td>
						<td class="align-middle" style="width:30px;">
							<div class="d-flex justify-content-center">
								<form class="form-inline" method="get" action="changeOrderStatus">
									<input hidden name="orderId" value="${orderDetail.orderId}"/>
									<input hidden name="productId" value="${orderDetail.productId}"/>
									<select class="form-control-sm" id="orderStatus" name="orderStatus">
										<c:if test='${orderDetail.orderDetailStatus == "결제완료"}'><option value="결제완료" selected>결제완료</option></c:if>
										<c:if test='${orderDetail.orderDetailStatus != "결제완료"}'><option value="결제완료">결제완료</option></c:if>
										<c:if test='${orderDetail.orderDetailStatus == "상품준비중"}'><option value="상품준비중" selected>상품준비중</option></c:if>
										<c:if test='${orderDetail.orderDetailStatus != "상품준비중"}'><option value="상품준비중">상품준비중</option></c:if>
										<c:if test='${orderDetail.orderDetailStatus == "배송시작"}'><option value="배송시작" selected>배송시작</option></c:if>
										<c:if test='${orderDetail.orderDetailStatus != "배송시작"}'><option value="배송시작">배송시작</option></c:if>
										<c:if test='${orderDetail.orderDetailStatus == "배송중"}'><option value="배송중" selected>배송중</option></c:if>
										<c:if test='${orderDetail.orderDetailStatus != "배송중"}'><option value="배송중">배송중</option></c:if>
										<c:if test='${orderDetail.orderDetailStatus == "배송완료"}'><option value="배송완료" selected>배송완료</option></c:if>
										<c:if test='${orderDetail.orderDetailStatus != "배송완료"}'><option value="배송완료">배송완료</option></c:if>
									</select>
									<button type="submit" class="btn btn-success btn-sm ml-2">등록</button>
								</form>
							</div>
						</td>
						<td class="align-middle" style="width:30px;">
							<span class="d-flex justify-content-center"><a href="#" onClick="updateProduct(${orderDetail.orderId}, ${orderDetail.productId}); return false;" class="btn btn-danger btn-sm">취소</a></span>
						</td>
					</tr>
				</c:forEach>
				<script>
					function updateProduct(orderId, productId) {
						var popupWidth = 600;
						var popupHeight = 300;
						var popupX = (window.screen.width/2) - (popupWidth/2);
						var popupY= (window.screen.height/2) - (popupHeight/2);
						
						let options = "toolbar=no,scrollbars=no,location=no,resizable=yes,status=no,menubar=no,height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY";
						window.open("adminCancelOrderForm?orderId="+orderId+"&productId="+productId, "_blank", "toolbar=no,scrollbars=no,location=no,resizable=yes,status=no,menubar=no,height="+popupHeight+", width="+popupWidth+", left="+popupX+", top="+popupY);
					}
				</script>
				<tr>
					<td colspan="12" class="text-center">
						<div>
							<a class="btn btn-outline-primary btn-sm" href="orderBoard?category=${orderDetailSearchCategory}&content=${orderDetailSearchContent}&pageNo=1">처음</a>
							<c:if test="${pager.groupNo>1}">
								<a class="btn btn-outline-info btn-sm" href="orderBoard?category=${orderDetailSearchCategory}&content=${orderDetailSearchContent}&pageNo=${pager.startPageNo-1}">이전</a>
							</c:if>
							
							<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
								<c:if test="${pager.pageNo != i}">
									<a class="btn btn-outline-success btn-sm" href="orderBoard?category=${orderDetailSearchCategory}&content=${orderDetailSearchContent}&pageNo=${i}">${i}</a>
								</c:if>
								<c:if test="${pager.pageNo == i}">
									<a class="btn btn-danger btn-sm" href="orderBoard?category=${orderDetailSearchCategory}&content=${orderDetailSearchContent}&pageNo=${i}">${i}</a>
								</c:if>
							</c:forEach>
							
							<c:if test="${pager.groupNo<pager.totalGroupNo}">
								<a class="btn btn-outline-info btn-sm" href="orderBoard?category=${orderDetailSearchCategory}&content=${orderDetailSearchContent}&pageNo=${pager.endPageNo+1}">다음</a>
							</c:if>
							<a class="btn btn-outline-primary btn-sm" href="orderBoard?category=${orderDetailSearchCategory}&content=${orderDetailSearchContent}&pageNo=${pager.totalPageNo}">맨끝</a>
						</div>
					</td>
				</tr>
			</tbody>
			
		</table>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>