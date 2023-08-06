<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="container-fluid flex-grow-1" style="margin-top:80px;">
	<div class="col">
		<div class="py-2 px-4">
			<div style="font-size: 20px">상품 목록</div>
		</div>
		<div class="d-flex flex-column justify-content-center">
			<div class="d-flex justify-content-center py-4" style="font-weight:bold; font-size: 15px;">상품 검색</div>
			<div class="d-flex justify-content-center py-3" style="border: 5px solid #e8e8e8;">
				<form method="get" action="productBoard" class="row justify-content-center" style="width: 300px">
				
					<div class="input-group row justify-content-center mb-2" style="width: 100%">
						<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 20%">ID</span>
						<input type="text" id="productId" name="productId" class="form-control-sm" style="width:80%;" 
							   placeholder="상품ID를 입력하세요" value="${productBoardSearch.productId}"/>
					</div>
					
					<div class="input-group row justify-content-center mb-2" style="width: 100%">
						<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 20%">상품명</span>
						<input type="text" id="productName" name="productName" class="form-control-sm" style="width:80%;" 
							   placeholder="상품명을 입력하세요" value="${productBoardSearch.productName}"/>
					</div>
					
					<div class="input-group row justify-content-center mb-2" style="width: 100%">
						<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 20%">판매가</span>
						<input type="text" id="productPriceStart" name="productPriceStart" class="form-control-sm" style="width:30%;"
							   value="${productBoardSearch.productPriceStart}"/>
						<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 5%"> </span>
						<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 15%">~</span>
						<input type="text" id="productPriceEnd" name="productPriceEnd" class="form-control-sm" style="width:30%;"
									 value="${productBoardSearch.productPriceEnd}"/>
					</div>
					
					<div class="input-group row justify-content-center mb-2" style="width: 100%">
						<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 20%">할인율</span>
						<input type="text" id="productDiscountRateStart" name="productDiscountRateStart" class="form-control-sm" style="width:30%;"
							   value="${productBoardSearch.productDiscountRateStart}"/>
						<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 5%"> </span>
						<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 15%">~</span>
						<input type="text" id="productDiscountRateEnd" name="productDiscountRateEnd" class="form-control-sm" style="width:30%;"
							   value="${productBoardSearch.productDiscountRateEnd}"/>
					</div>
					
					<div class="input-group row justify-content-center mb-2" style="width: 100%">
						<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 20%">테마</span>
						<select id="productTheme" name="productTheme" class="form-control-sm" style="width:80%">
							<option value="">테마 선택</option>
							<c:if test='${productBoardSearch.productTheme == "wave"}'><option value="wave" selected>wave</option></c:if>
							<c:if test='${productBoardSearch.productTheme != "wave"}'><option value="wave">wave</option></c:if>
							<c:if test='${productBoardSearch.productTheme == "tree"}'><option value="tree" selected>tree</option></c:if>
							<c:if test='${productBoardSearch.productTheme != "tree"}'><option value="tree">tree</option></c:if>
							<c:if test='${productBoardSearch.productTheme == "house"}'><option value="house" selected>house</option></c:if>
							<c:if test='${productBoardSearch.productTheme != "house"}'><option value="house">house</option></c:if>
							<c:if test='${productBoardSearch.productTheme == "street"}'><option value="street" selected>street</option></c:if>
							<c:if test='${productBoardSearch.productTheme != "street"}'><option value="street">street</option></c:if>
							<c:if test='${productBoardSearch.productTheme == "other"}'><option value="other" selected>other</option></c:if>
							<c:if test='${productBoardSearch.productTheme != "other"}'><option value="other">other</option></c:if>
						</select>
					</div>
					
					<div class="input-group row justify-content-center mb-2" style="width: 100%">
						<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 20%">작가</span>
						<select id="productArtist" name="productArtist" class="form-control-sm" style="width:80%">
							<option value="">아티스트 선택</option>
							<c:if test='${productBoardSearch.productArtist == "songwon"}'><option value="songwon" selected>songwon</option></c:if>
							<c:if test='${productBoardSearch.productArtist != "songwon"}'><option value="songwon">songwon</option></c:if>
							<c:if test='${productBoardSearch.productArtist == "kimfefe"}'><option value="kimfefe" selected>kimfefe</option></c:if>
							<c:if test='${productBoardSearch.productArtist != "kimfefe"}'><option value="kimfefe">kimfefe</option></c:if>
							<c:if test='${productBoardSearch.productArtist == "hyeonjulee"}'><option value="hyeonjulee" selected>hyeonjulee</option></c:if>
							<c:if test='${productBoardSearch.productArtist != "hyeonjulee"}'><option value="hyeonjulee">hyeonjulee</option></c:if>
							<c:if test='${productBoardSearch.productArtist == "other"}'><option value="other" selected>other</option></c:if>
							<c:if test='${productBoardSearch.productArtist != "other"}'><option value="other">other</option></c:if>
						</select>
					</div>
					
					<div class="input-group row justify-content-center mb-2" style="width: 100%">
						<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 20%">텍스처</span>
						<select id="productTexture" name="productTexture" class="form-control-sm" style="width:80%">
							<option value="">텍스처 선택</option>
							<c:if test='${productBoardSearch.productTexture == "normal"}'><option value="normal" selected>normal</option></c:if>
							<c:if test='${productBoardSearch.productTexture != "normal"}'><option value="normal">normal</option></c:if>
							<c:if test='${productBoardSearch.productTexture == "fabric"}'><option value="fabric" selected>fabric</option></c:if>
							<c:if test='${productBoardSearch.productTexture != "fabric"}'><option value="fabric">fabric</option></c:if>
						</select>
					</div>
					
					<div class="input-group row justify-content-center mb-2" style="width: 100%">
						<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 20%">재고</span>
						<input type="text" id="productStockStart" name="productStockStart" class="form-control-sm" style="width:30%;"
							   value="${productBoardSearch.productStockStart}"/>
						<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 5%"> </span>
						<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 15%">~</span>
						<input type="text" id="productStockEnd" name="productStockEnd" class="form-control-sm" style="width:30%;"
							   value="${productBoardSearch.productStockStart}"/>
					</div>
					
					<button class="btn btn-dark btn-sm mt-3">검색</button>
				</form>
			</div>
			<div class="d-flex justify-content-end px-2 pt-1 pb-3">
				<a class="btn btn-secondary btn-sm" style="color: white;">검색 초기화</a>
			</div>
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
							<a class="btn btn-outline-primary btn-sm" href="productBoard?productId=${productBoardSearch.productId}&
																			productName=${productBoardSearch.productName}&
																			productPriceStart=${productBoardSearch.productPriceStart}&
																			productPriceEnd=${productBoardSearch.productPriceEnd}&
																			productDiscountRateStart=${productBoardSearch.productDiscountRateStart}&
																			productDiscountRateEnd=${productBoardSearch.productDiscountRateEnd}&
																			productTheme=${productBoardSearch.productTheme}&
																			productArtist=${productBoardSearch.productArtist}&
																			productTexture=${productBoardSearch.productTexture}&
																			productStockStart=${productBoardSearch.productStockStart}&
																			productStockEnd=${productBoardSearch.productStockEnd}&
																			pageNo=1">처음</a>
							<c:if test="${pager.groupNo>1}">
								<a class="btn btn-outline-info btn-sm" href="productBoard?productId=${productBoardSearch.productId}&
																			productName=${productBoardSearch.productName}&
																			productPriceStart=${productBoardSearch.productPriceStart}&
																			productPriceEnd=${productBoardSearch.productPriceEnd}&
																			productDiscountRateStart=${productBoardSearch.productDiscountRateStart}&
																			productDiscountRateEnd=${productBoardSearch.productDiscountRateEnd}&
																			productTheme=${productBoardSearch.productTheme}&
																			productArtist=${productBoardSearch.productArtist}&
																			productTexture=${productBoardSearch.productTexture}&
																			productStockStart=${productBoardSearch.productStockStart}&
																			productStockEnd=${productBoardSearch.productStockEnd}&
																			pageNo=${pager.startPageNo-1}">이전</a>
							</c:if>
							
							<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
								<c:if test="${pager.pageNo != i}">
									<a class="btn btn-outline-success btn-sm" href="productBoard?productId=${productBoardSearch.productId}&
																			productName=${productBoardSearch.productName}&
																			productPriceStart=${productBoardSearch.productPriceStart}&
																			productPriceEnd=${productBoardSearch.productPriceEnd}&
																			productDiscountRateStart=${productBoardSearch.productDiscountRateStart}&
																			productDiscountRateEnd=${productBoardSearch.productDiscountRateEnd}&
																			productTheme=${productBoardSearch.productTheme}&
																			productArtist=${productBoardSearch.productArtist}&
																			productTexture=${productBoardSearch.productTexture}&
																			productStockStart=${productBoardSearch.productStockStart}&
																			productStockEnd=${productBoardSearch.productStockEnd}&
																			pageNo=${i}">${i}</a>
								</c:if>
								<c:if test="${pager.pageNo == i}">
									<a class="btn btn-danger btn-sm" href="productBoard?productId=${productBoardSearch.productId}&
																			productName=${productBoardSearch.productName}&
																			productPriceStart=${productBoardSearch.productPriceStart}&
																			productPriceEnd=${productBoardSearch.productPriceEnd}&
																			productDiscountRateStart=${productBoardSearch.productDiscountRateStart}&
																			productDiscountRateEnd=${productBoardSearch.productDiscountRateEnd}&
																			productTheme=${productBoardSearch.productTheme}&
																			productArtist=${productBoardSearch.productArtist}&
																			productTexture=${productBoardSearch.productTexture}&
																			productStockStart=${productBoardSearch.productStockStart}&
																			productStockEnd=${productBoardSearch.productStockEnd}&
																			pageNo=${i}">${i}</a>
								</c:if>
							</c:forEach>
							
							<c:if test="${pager.groupNo<pager.totalGroupNo}">
								<a class="btn btn-outline-info btn-sm" href="productBoard?productId=${productBoardSearch.productId}&
																			productName=${productBoardSearch.productName}&
																			productPriceStart=${productBoardSearch.productPriceStart}&
																			productPriceEnd=${productBoardSearch.productPriceEnd}&
																			productDiscountRateStart=${productBoardSearch.productDiscountRateStart}&
																			productDiscountRateEnd=${productBoardSearch.productDiscountRateEnd}&
																			productTheme=${productBoardSearch.productTheme}&
																			productArtist=${productBoardSearch.productArtist}&
																			productTexture=${productBoardSearch.productTexture}&
																			productStockStart=${productBoardSearch.productStockStart}&
																			productStockEnd=${productBoardSearch.productStockEnd}&
																			pageNo=${pager.endPageNo+1}">다음</a>
							</c:if>
							<a class="btn btn-outline-primary btn-sm" href="productBoard?productId=${productBoardSearch.productId}&
																			productName=${productBoardSearch.productName}&
																			productPriceStart=${productBoardSearch.productPriceStart}&
																			productPriceEnd=${productBoardSearch.productPriceEnd}&
																			productDiscountRateStart=${productBoardSearch.productDiscountRateStart}&
																			productDiscountRateEnd=${productBoardSearch.productDiscountRateEnd}&
																			productTheme=${productBoardSearch.productTheme}&
																			productArtist=${productBoardSearch.productArtist}&
																			productTexture=${productBoardSearch.productTexture}&
																			productStockStart=${productBoardSearch.productStockStart}&
																			productStockEnd=${productBoardSearch.productStockEnd}&
																			pageNo=${pager.totalPageNo}">맨끝</a>
						</div>
					</td>
				</tr>
			
			</thead>
		</table>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>