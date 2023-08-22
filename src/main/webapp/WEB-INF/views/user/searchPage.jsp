<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchPageStyle.css"/>

<script>
	$(init);
	
	function init() {
		
		const isMobile = () => {
			try {
				document.createEvent("TouchEvent");
				return true;
			} catch (e) {
				return false;
			}
		};
		
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
		
		if (isMobile()) {
			$('.totalProduct').click(function() {
				if ($(this).find('.productDetail').css('opacity') == 0) {
					$(this).find('.productDetail').fadeTo(200,1);
				} else {
					$('.productDetail').css('opacity', 0);
					productId = $(this).find('.currentProductId').html();
					location.href = 'productDetail?productId=' + productId;
				}
			});
		} else {
			$('.totalProduct').hover(function() {
				$(this).find('.productDetail').fadeTo(200, 1);
			}, function() {
				$(this).find('.productDetail').fadeTo(200, 0);
			});
			$('.totalProduct').click(function() {
				productId = $(this).find('.currentProductId').html();
				location.href = 'productDetail?productId=' + productId;
			});
		}
		
		
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
						<form id="searchForm" method="get" action="search" class="row justify-content-center" style="width: 300px">
						
							<div class="input-group row justify-content-center mb-2" style="width: 100%">
								<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 20%">상품명</span>
								<input type="text" id="productName" name="productName" class="form-control-sm" style="width:80%;" 
									   placeholder="상품명을 입력하세요" value="${productBoardSearchForm.productName}"/>
							</div>
							
							<div class="input-group row justify-content-center mb-2" style="width: 100%">
								<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 20%">판매가</span>
								<input type="text" id="productPriceStart" name="productPriceStart" class="form-control-sm" style="width:30%;"
									   value="${productBoardSearchForm.productPriceStart}"/>
								
								<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 5%"> </span>
								<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 15%">~</span>
								<input type="text" id="productPriceEnd" name="productPriceEnd" class="form-control-sm" style="width:30%;"
											 value="${productBoardSearchForm.productPriceEnd}"/>
							</div>
							<div>
								<div><form:errors style="font-size:12px;" cssClass="text-danger d-flex align-items-center" path="productBoardSearchForm.productPriceStart"/></div>
								<div><form:errors style="font-size:12px;" cssClass="text-danger d-flex align-items-center" path="productBoardSearchForm.productPriceEnd" /></div>
							</div>
							
							<div class="input-group row justify-content-center mb-2" style="width: 100%">
								<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 20%">할인율</span>
								<input type="text" id="productDiscountRateStart" name="productDiscountRateStart" class="form-control-sm" style="width:30%;"
									   value="${productBoardSearchForm.productDiscountRateStart}"/>
								<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 5%"> </span>
								<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 15%">~</span>
								<input type="text" id="productDiscountRateEnd" name="productDiscountRateEnd" class="form-control-sm" style="width:30%;"
									   value="${productBoardSearchForm.productDiscountRateEnd}"/>
							</div>
							<div>
								<div><form:errors style="font-size:12px;" cssClass="text-danger d-flex align-items-center" path="productBoardSearchForm.productDiscountRateStart" /></div>
								<div><form:errors style="font-size:12px;" cssClass="text-danger d-flex align-items-center" path="productBoardSearchForm.productDiscountRateEnd" /></div>
							</div>
							
							<div class="input-group row justify-content-center mb-2" style="width: 100%">
								<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 20%">테마</span>
								<select id="productTheme" name="productTheme" class="form-control-sm" style="width:80%">
									<option value="">테마 선택</option>
									<c:if test='${productBoardSearchForm.productTheme == "wave"}'><option value="wave" selected>wave</option></c:if>
									<c:if test='${productBoardSearchForm.productTheme != "wave"}'><option value="wave">wave</option></c:if>
									<c:if test='${productBoardSearchForm.productTheme == "forest"}'><option value="forest" selected>forest</option></c:if>
									<c:if test='${productBoardSearchForm.productTheme != "forest"}'><option value="forest">forest</option></c:if>
									<c:if test='${productBoardSearchForm.productTheme == "window"}'><option value="window" selected>window</option></c:if>
									<c:if test='${productBoardSearchForm.productTheme != "window"}'><option value="window">window</option></c:if>
									<c:if test='${productBoardSearchForm.productTheme == "life"}'><option value="life" selected>life</option></c:if>
									<c:if test='${productBoardSearchForm.productTheme != "life"}'><option value="life">life</option></c:if>
								</select>
							</div>
							
							<div class="input-group row justify-content-center mb-2" style="width: 100%">
								<span class="align-self-center pr-3 d-flex justify-content-center" style="font-weight:bold; width: 20%">작가</span>
								<select id="productArtist" name="productArtist" class="form-control-sm" style="width:80%">
									<option value="">아티스트 선택</option>
									<c:if test='${productBoardSearchForm.productArtist == "유래혁"}'><option value="유래혁" selected>유래혁</option></c:if>
									<c:if test='${productBoardSearchForm.productArtist != "유래혁"}'><option value="유래혁">유래혁</option></c:if>
									<c:if test='${productBoardSearchForm.productArtist == "문예진"}'><option value="문예진" selected>문예진</option></c:if>
									<c:if test='${productBoardSearchForm.productArtist != "문예진"}'><option value="문예진">문예진</option></c:if>
									<c:if test='${productBoardSearchForm.productArtist == "other"}'><option value="other" selected>other</option></c:if>
									<c:if test='${productBoardSearchForm.productArtist != "other"}'><option value="other">other</option></c:if>
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
					<a id="toggleSearchButton" href="javascript:void(0)" class="btn btn-dark btn-sm" style="color: white;">검색창 닫기</a>
				</div>
			</div>
			<%-- 상품 리스트 --%>
			<div style="position:relative;">
				<ul id="productList">
					<c:forEach var="image" items="${convertedImages}" varStatus="status">
						<li>
							<a class="totalProduct" href="javascript:void(0)" onclick="">
								<div class="thumbnail">
									<img class="imgOnList mb-3" src="data:image/jpeg;base64, ${image}">
									<div class="productDetail">
										<div class="productDetailDiv" style="display:block;">
											<div class="productDetailDiv2">
												<div class="currentProductId" style="display:none">${productList[status.index].productId}</div>
												<div class="d-flex justify-content-start" style="font-size:18px;">${productList[status.index].productName}</div>
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
				   href="search?productId=${productBoardSearchForm.productId}&
						productName=${productBoardSearchForm.productName}&
						productPriceStart=${productBoardSearchForm.productPriceStart}&
						productPriceEnd=${productBoardSearchForm.productPriceEnd}&
						productDiscountRateStart=${productBoardSearchForm.productDiscountRateStart}&
						productDiscountRateEnd=${productBoardSearchForm.productDiscountRateEnd}&
						productTheme=${productBoardSearchForm.productTheme}&
						productArtist=${productBoardSearchForm.productArtist}&
						pageNo=1">first</a>
				<c:if test="${pager.groupNo>1}">
					<a class="text-dark mr-2" style="font-weight:600;" 
					   href="search?productId=${productBoardSearchForm.productId}&
							productName=${productBoardSearchForm.productName}&
							productPriceStart=${productBoardSearchForm.productPriceStart}&
							productPriceEnd=${productBoardSearchForm.productPriceEnd}&
							productDiscountRateStart=${productBoardSearchForm.productDiscountRateStart}&
							productDiscountRateEnd=${productBoardSearchForm.productDiscountRateEnd}&
							productTheme=${productBoardSearchForm.productTheme}&
							productArtist=${productBoardSearchForm.productArtist}&
							pageNo=${pager.startPageNo-1}">prev</a>
				</c:if>
				
				<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
					<c:if test="${pager.pageNo != i}">
						<a class="text-dark" style="font-weight:600; padding:0 2px 0 2px;" 
						   href="search?productId=${productBoardSearchForm.productId}&
								productName=${productBoardSearchForm.productName}&
								productPriceStart=${productBoardSearchForm.productPriceStart}&
								productPriceEnd=${productBoardSearchForm.productPriceEnd}&
								productDiscountRateStart=${productBoardSearchForm.productDiscountRateStart}&
								productDiscountRateEnd=${productBoardSearchForm.productDiscountRateEnd}&
								productTheme=${productBoardSearchForm.productTheme}&
								productArtist=${productBoardSearchForm.productArtist}&
								pageNo=${i}">${i}</a>
					</c:if>
					<c:if test="${pager.pageNo == i}">
						<a class="text-dark" style="font-weight:600; padding:0 2px 0 2px; text-decoration:underline;" 
						   href="search?productId=${productBoardSearchForm.productId}&
								productName=${productBoardSearchForm.productName}&
								productPriceStart=${productBoardSearchForm.productPriceStart}&
								productPriceEnd=${productBoardSearchForm.productPriceEnd}&
								productDiscountRateStart=${productBoardSearchForm.productDiscountRateStart}&
								productDiscountRateEnd=${productBoardSearchForm.productDiscountRateEnd}&
								productTheme=${productBoardSearchForm.productTheme}&
								productArtist=${productBoardSearchForm.productArtist}&
								pageNo=${i}">${i}</a>
					</c:if>
				</c:forEach>
							
				<c:if test="${pager.groupNo<pager.totalGroupNo}">
					<a class="text-dark ml-2" style="font-weight:600;" 
					   href="search?productId=${productBoardSearchForm.productId}&
							productName=${productBoardSearchForm.productName}&
							productPriceStart=${productBoardSearchForm.productPriceStart}&
							productPriceEnd=${productBoardSearchForm.productPriceEnd}&
							productDiscountRateStart=${productBoardSearchForm.productDiscountRateStart}&
							productDiscountRateEnd=${productBoardSearchForm.productDiscountRateEnd}&
							productTheme=${productBoardSearchForm.productTheme}&
							productArtist=${productBoardSearchForm.productArtist}&
							pageNo=${pager.endPageNo+1}">next</a>
				</c:if>
				<a class="text-dark ml-2" style="font-weight:600;" 
				   href="search?productId=${productBoardSearchForm.productId}&
						productName=${productBoardSearchForm.productName}&
						productPriceStart=${productBoardSearchForm.productPriceStart}&
						productPriceEnd=${productBoardSearchForm.productPriceEnd}&
						productDiscountRateStart=${productBoardSearchForm.productDiscountRateStart}&
						productDiscountRateEnd=${productBoardSearchForm.productDiscountRateEnd}&
						productTheme=${productBoardSearchForm.productTheme}&
						productArtist=${productBoardSearchForm.productArtist}&
						pageNo=${pager.totalPageNo}">last</a>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>