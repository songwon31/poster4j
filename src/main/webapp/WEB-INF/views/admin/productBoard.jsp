<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script>
	$(init);
	
	function init() {
		$("#productBoardSearchForm").bind("submit", function (event) {
			
			let productId = $("#productId").val();
			let productName = $("#productName").val();
			let productPriceStart = $("#productPriceStart").val();
			let productPriceEnd = $("#productPriceEnd").val();
			let productDiscountRateStart = $("#productDiscountRateStart").val();
			let productDiscountRateEnd = $("#productDiscountRateEnd").val();
			
			let isValid = true;
			let numPattern = /^[0-9]+$/;
			
			if (productId.trim() != "" && !numPattern.test(productId.trim())) {
				isValid = false;
				alert("ID는 숫자로 입력해주세요.")
			} else if (productPriceStart.trim() != "" && !numPattern.test(productPriceStart.trim())) {
				isValid = false;
				alert("판매가 범위는 숫자로 입력해주세요.")
			} else if (productPriceEnd.trim() != "" && !numPattern.test(productPriceEnd.trim())) {
				isValid = false;
				alert("판매가 범위는 숫자로 입력해주세요.")
			} else if (productDiscountRateStart.trim() != "" && !numPattern.test(productDiscountRateStart.trim())) {
				isValid = false;
				alert("할인율 범위는 숫자로 입력해주세요.")
			} else if (productDiscountRateEnd.trim() != "" && !numPattern.test(productDiscountRateEnd.trim())) {
				isValid = false;
				alert("할인율 범위는 숫자로 입력해주세요.")
			}

		    // 유효성 검사가 실패하면 제출 이벤트를 취소합니다.
		    if (!isValid) {
		        event.preventDefault();
		    }
		})
	}
	
</script>

<div class="container-fluid flex-grow-1" style="margin-top:80px;">
	<div class="col">
		<div class="py-2 px-4">
			<div style="font-size: 20px">상품 목록</div>
		</div>
		<div id="productSearchDiv" style="display: block">
			<div class="d-flex flex-column justify-content-center">
				<div class="d-flex justify-content-center py-4" style="font-weight:bold; font-size: 15px;">상품 검색</div>
				<div class="d-flex justify-content-center py-3" style="border: 5px solid #e8e8e8;">
					<form id="productBoardSearchForm" method="get" action="productBoard" class="row justify-content-center" style="width: 300px">
					
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
								<c:if test='${productBoardSearch.productTheme == "forest"}'><option value="forest" selected>forest</option></c:if>
								<c:if test='${productBoardSearch.productTheme != "forest"}'><option value="forest">forest</option></c:if>
								<c:if test='${productBoardSearch.productTheme == "window"}'><option value="window" selected>window</option></c:if>
								<c:if test='${productBoardSearch.productTheme != "window"}'><option value="window">window</option></c:if>
								<c:if test='${productBoardSearch.productTheme == "life"}'><option value="life" selected>life</option></c:if>
								<c:if test='${productBoardSearch.productTheme != "life"}'><option value="life">life</option></c:if>
							</select>
						</div>
						
						<div class="input-group row justify-content-center mb-2" style="width: 100%">
							<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 20%">작가</span>
							<select id="productArtist" name="productArtist" class="form-control-sm" style="width:80%">
								<option value="">아티스트 선택</option>
								<c:if test='${productBoardSearch.productArtist == "유래혁"}'><option value="유래혁" selected>유래혁</option></c:if>
								<c:if test='${productBoardSearch.productArtist != "유래혁"}'><option value="유래혁">유래혁</option></c:if>
								<c:if test='${productBoardSearch.productArtist == "문예진"}'><option value="문예진" selected>문예진</option></c:if>
								<c:if test='${productBoardSearch.productArtist != "문예진"}'><option value="문예진">문예진</option></c:if>
								<c:if test='${productBoardSearch.productArtist == "other"}'><option value="other" selected>other</option></c:if>
								<c:if test='${productBoardSearch.productArtist != "other"}'><option value="other">other</option></c:if>
							</select>
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
						var popupHeight = 480;
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
						var popupHeight = 480;
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
																			pageNo=${pager.totalPageNo}">맨끝</a>
						</div>
					</td>
				</tr>
			
			</tbody>
		</table>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>