<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="container-fluid flex-grow-1" style="margin-top:80px;">
	<div class="row">
		<div class="py-2 px-4">
			<div style="font-size: 20px">상품 목록</div>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">상품명</th>
					<th scope="col">가격</th>
					<th scope="col">할인율</th>
					<th scope="col">테마</th>
					<th scope="col">아티스트</th>
					<th scope="col">텍스처</th>
					<th scope="col">재고</th>
					<th scope="col">수정</th>
					<th scope="col">삭제</th>
				</tr>
				
				<c:forEach var="product" items="${productList}" varStatus="status">
					<tr>
						<td scope="row">${product.productId}</td>
						<td>${product.productName}</td>
						<td>${product.productPrice}</td>
						<td>${product.productDiscountRate}</td>
						<td>${product.productTheme}</td>
						<td>${product.productArtist}</td>
						<td>${product.productTexture}</td>
						<td>${product.productStock}</td>
						<td>
							<form method="get" action="${pageContext.request.contextPath}/admin/updateProductForm">
								<input hidden name="productId" value="${product.productId}"/>
								<button class="btn btn-primary btn-sm">상품 수정<buttton>
							</form>
						</td>
						<td>
							<form method="get" action="deleteProduct">
								<input hidden name="productId" value="${product.productId}"/>
								<button class="btn btn-danger btn-sm">상품 삭제<buttton>
							</form>
						</td>
					</tr>
				</c:forEach>
				
				<tr>
					<td colspan="12" class="text-center">
						<div>
							<a class="btn btn-outline-primary btn-sm" href="productBoard?pageNo=1">처음</a>
							<c:if test="${pager.groupNo>1}">
								<a class="btn btn-outline-info btn-sm" href="productBoard?pageNo=${pager.startPageNo-1}">이전</a>
							</c:if>
							
							<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
								<c:if test="${pager.pageNo != i}">
									<a class="btn btn-outline-success btn-sm" href="productBoard?pageNo=${i}">${i}</a>
								</c:if>
								<c:if test="${pager.pageNo == i}">
									<a class="btn btn-danger btn-sm" href="productBoard?pageNo=${i}">${i}</a>
								</c:if>
							</c:forEach>
							
							<c:if test="${pager.groupNo<pager.totalGroupNo}">
								<a class="btn btn-outline-info btn-sm" href="productBoard?pageNo=${pager.endPageNo+1}">다음</a>
							</c:if>
							<a class="btn btn-outline-primary btn-sm" href="productBoard?pageNo=${pager.totalPageNo}">맨끝</a>
						</div>
					</td>
				</tr>
			
			</thead>
		</table>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>