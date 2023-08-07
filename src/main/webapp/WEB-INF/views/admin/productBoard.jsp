<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="container-fluid flex-grow-1" style="margin-top:80px;">
	<div class="col">
		<div class="py-2 px-4">
			<div style="font-size: 20px">상품 목록</div>
		</div>
		<div id="productSearchDiv" style="display: block">
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
					<a href="removeSearch" class="btn btn-secondary btn-sm" style="color: white;">검색 초기화</a>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-end px-2 pt-1 pb-3">
			<a id="toggleSearchButton" href="#" class="btn btn-dark btn-sm" style="color: white;">검색창 닫기</a>
		</div>
		<script>
			$(init);
			
			function init() {
				if (window.name != null) {
					$('#productSearchDiv').css('display', window.name);
					if (window.name == "block") {
						$('#toggleSearchButton').html('검색창 닫기');
					} else if (window.name == "none") {
						$('#toggleSearchButton').html('검색창 열기');
					}
				}
				
				$('#toggleSearchButton').click(function(){
					if ($('#productSearchDiv').css('display') === "block") {
						$('#productSearchDiv').css('display','none');
						$('#toggleSearchButton').html('검색창 열기');
					} else {
						$('#productSearchDiv').css('display','block');
						$('#toggleSearchButton').html('검색창 닫기');
					}
					window.name = $('#productSearchDiv').css('display');
				});
			}
		</script>
		<table class="table">
			<thead>
				<tr>
					<th scope="col"><span class="d-flex justify-content-center">ID</span></th>
					<th scope="col"><span class="d-flex justify-content-center">상품명</span></th>
					<th scope="col"><span class="d-flex justify-content-center">가격</span></th>
					<th scope="col"><span class="d-flex justify-content-center">할인율</span></th>
					<th scope="col"><span class="d-flex justify-content-center">테마</span></th>
					<th scope="col"><span class="d-flex justify-content-center">아티스트</span></th>
					<th scope="col"><span class="d-flex justify-content-center">텍스처</span></th>
					<th scope="col"><span class="d-flex justify-content-center">재고</span></th>
					<th scope="col"><span class="d-flex justify-content-center">수정</span></th>
					<th scope="col"><span class="d-flex justify-content-center">삭제</span></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${productList}" varStatus="status">
					<tr>
						<td class="align-middle" scope="row" style="width:10px;"><span class="d-flex justify-content-center">${product.productId}</span></td>
						<td class="align-middle" style="width:30px;"><span class="d-flex justify-content-center">${product.productName}</span></td>
						<td class="align-middle" style="width:30px;"><span class="d-flex justify-content-center">${product.productPrice}</span></td>
						<td class="align-middle" style="width:50px;"><span class="d-flex justify-content-center">${product.productDiscountRate}</span></td>
						<td class="align-middle" style="width:30px;"><span class="d-flex justify-content-center">${product.productTheme}</span></td>
						<td class="align-middle" style="width:30px;"><span class="d-flex justify-content-center">${product.productArtist}</span></td>
						<td class="align-middle" style="width:30px;"><span class="d-flex justify-content-center">${product.productTexture}</span></td>
						<td class="align-middle" style="width:30px;"><span class="d-flex justify-content-center">${product.productStock}</span></td>
						<td class="align-middle" style="width:30px;">
							<form method="get" action="${pageContext.request.contextPath}/admin/updateProductForm" class="d-flex justify-content-center">
								<input hidden name="productId" value="${product.productId}"/>
								<a id="updateProductButton" href="#" onClick="updateProduct(${product.productId}); return false;" class="btn btn-primary btn-sm">수정</a>
							</form>
						</td>
						
						<td class="align-middle" style="width:30px;">
							<form method="get" action="deleteProduct" class="d-flex justify-content-center">
								<input hidden name="productId" value="${product.productId}"/>
								<button class="btn btn-danger btn-sm">삭제<buttton>
							</form>
						</td>
					</tr>
				</c:forEach>
				<script>
					function updateProduct(productId) {
						var popupWidth = 400;
						var popupHeight = 350;
						var popupX = (window.screen.width/2)-(popupWidth/2);
						var popupY= (window.screen.height/2)-(popupHeight/2);
						
						let options = "toolbar=no,scrollbars=no,location=no,resizable=yes,status=no,menubar=no,height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY";
						window.open("updateProductForm?productId=" + productId, "_blank", "toolbar=no,scrollbars=no,location=no,resizable=yes,status=no,menubar=no,height="+popupHeight+", width="+popupWidth+", left="+popupX+", top="+popupY);
					}
				</script>
				<tr>
					<td colspan="12">
						<span class="d-flex justify-content-end">
							<a href="#" onClick="registerProduct(); return false;" class="btn btn-success btn-sm">상품 등록</a>
						</span>
					</td>
				</tr>
				<script>
					function registerProduct() {
						var popupWidth = 400;
						var popupHeight = 350;
						var popupX = (window.screen.width/2)-(popupWidth/2);
						var popupY= (window.screen.height/2)-(popupHeight/2);
						
						let options = "toolbar=no,scrollbars=no,location=no,resizable=yes,status=no,menubar=no,height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY";
						window.open("registerProductForm", "_blank", "toolbar=no,scrollbars=no,location=no,resizable=yes,status=no,menubar=no,height="+popupHeight+", width="+popupWidth+", left="+popupX+", top="+popupY);
					}
				</script>
				<tr>
					<td colspan="12" class="text-center" style="border:none;">
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
			
			</tbody>
		</table>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>