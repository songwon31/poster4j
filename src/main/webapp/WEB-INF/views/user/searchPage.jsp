<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchPageStyle.css"/>

<script>
	$(init);
	
	function init() {
		function setColumnCounts() {
			var innerWidth = window.innerWidth;
			var productList = $("#productList");
			if (innerWidth > 1024) {
				productList.css("column-count", 3);
			} else if (innerWidth > 768) {
				productList.css("column-count", 2);
			} else {
				productList.css("column-count", 1);
			}
		}
		
		setColumnCounts();
		
		if (window.name != null) {
			$('#productSearchDiv').css('display', window.name);
			if (window.name == "block") {
				$('#toggleSearchButton').html('검색창 닫기');
			} else if (window.name == "none") {
				$('#toggleSearchButton').html('검색창 열기');
			}
		}
		
		$(window).resize(setColumnCounts);
		
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
		
		$('.thumbnail').hover(function() {
			$(this).find('.productDetail').css('display','block');
		}, function() {
			$(this).find('.productDetail').css('display','none');
		});
	}
</script>

<div class="wrapper">
	<div id="container">
		<div id="contents">
			<%-- 검색창 --%>
			<div style="height:60px;"></div>
			<div id="productSearchDiv" style="display: block; padding: 0 30px;">
				<div class="d-flex flex-column justify-content-center">
					<div class="d-flex justify-content-center py-4" style="font-weight:bold; font-size: 15px;">상품 검색</div>
					<div class="d-flex justify-content-center py-3" style="border: 5px solid #e8e8e8;">
						<form method="get" action="search" class="row justify-content-center" style="width: 300px">
						
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
							
							<button class="btn btn-dark btn-sm mt-3">검색</button>
						</form>
					</div>
					<div class="d-flex justify-content-end px-2 pt-1 pb-2">
						<a href="removeSearch" class="btn btn-secondary btn-sm" style="color: white;">검색 초기화</a>
					</div>
				</div>
			</div>
			<div style="padding: 0 30px;">
				<div class="d-flex justify-content-end px-2 pb-3">
					<a id="toggleSearchButton" href="#" class="btn btn-dark btn-sm" style="color: white;">검색창 닫기</a>
				</div>
			</div>
			<%-- 상품 리스트 --%>
			<div style="position:relative;">
				<ul id="productList">
					<c:forEach var="image" items="${convertedImages}" varStatus="status">
						<li>
							<a href="productDetail?productId=${productList[status.index].productId}">
								<div class="thumbnail">
									<img class="imgOnList mb-3" src="data:image/jpeg;base64, ${image}">
									<div class="productDetail" style="display:none;">
										<div class="productDetailDiv" style="display:block;">
											<div class="productDetailDiv2">
												<div class="d-flex justify-content-start" style="font-size:18px;;">${productList[status.index].productName}</div>
												<br>
												<div class="d-flex justify-content-start" style="">${productList[status.index].productDetail}</div>
												<br><br>
												<c:if test="${productList[status.index].productDiscountRate > 0}">
													<div class="d-flex justify-content-end" style="text-decoration: line-through;">KRW: ${productList[status.index].productPrice}</div>
													<div class="d-flex justify-content-end">KRW: ${(productList[status.index].productPrice * (1.0 - productList[status.index].productDiscountRate)).intValue()}</div>
												</c:if>
												<c:if test="${productList[status.index].productDiscountRate == 0}">
													<div class="d-flex justify-content-end" style="">KRW: ${productList[status.index].productPrice}</div>
												</c:if>
											</div>
										</div>
									</div>
									<span>
										<span style="text-decoration:none; color:black;">[${productList[status.index].productTheme}] </span>
										<span style="text-decoration:none; color:black;">${productList[status.index].productName}</span>
									</span>
								</div>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="d-flex justify-content-center">
				<a class="text-dark mr-2" style="font-weight:600;" 
				   href="search?productId=${productBoardSearch.productId}&
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
						pageNo=1">first</a>
				<c:if test="${pager.groupNo>1}">
					<a class="text-dark mr-2" style="font-weight:600;" 
					   href="search?productId=${productBoardSearch.productId}&
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
							pageNo=${pager.startPageNo-1}">prev</a>
				</c:if>
				
				<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
					<c:if test="${pager.pageNo != i}">
						<a class="text-dark" style="font-weight:600; padding:0 2px 0 2px;" 
						   href="search?productId=${productBoardSearch.productId}&
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
						<a class="text-dark" style="font-weight:600; padding:0 2px 0 2px; text-decoration:underline;" 
						   href="search?productId=${productBoardSearch.productId}&
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
					<a class="text-dark ml-2" style="font-weight:600;" 
					   href="search?productId=${productBoardSearch.productId}&
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
							pageNo=${pager.endPageNo+1}">next</a>
				</c:if>
				<a class="text-dark ml-2" style="font-weight:600;" 
				   href="search?productId=${productBoardSearch.productId}&
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
						pageNo=${pager.totalPageNo}">last</a>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>