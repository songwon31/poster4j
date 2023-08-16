<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- home 스타일 설정을 위한 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
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
		
		$(window).resize(setColumnCounts);
		
		$(".navbar").css('background','')
		
		//포스터 이미지를 다 로딩이 된 후에 보여주기.
		$("#contents").show();
		
		$('[data-toggle="tooltip"]').tooltip();
		
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

<%-- home.jsp의 중앙내용 --%>
<div id="wrapper">
	<div id="container">
		<!-- 메인 포스터 -->
		<div id="main-poster" class="container-fluid" style="background-color: #F4F4F4; " >
			<div id="frame" style="background-image: url('data:image/jpeg;base64, ${randomImage}');">
				<img id="frame-image" alt="프레임" src="${pageContext.request.contextPath}/resources/images/frame.png" width="450px" height="630px;">
			</div>
		</div>
		<!-- 감성 글귀-->
		<!-- <div style="min-height: 542px; display:flex; padding-left: 30px; padding-right: 30px;">
			<div id="wrap">
				<span class="mb-3" style="display: block; font-size: 72px; font-weight: 600; line-height: 1.1">poster</span>
				<span class="mb-3" style="display: block; font-size: 72px; word-spacing: -10px;">the most beautiful tool</span>
				<span class="mb-3" style="display: block; font-size: 72px; word-spacing: -10px;">to start a journey</span>
				<span class="mb-3" style="display: block; font-size: 72px; text-align: right;">&copy;2023</span>
			</div>
		</div> -->
		<!-- 슬로건 -->
		<div id="slogan" style="padding: 42px 13px 100px;"> 
			<h2 style="text-align: center; ">
				<span style="display: block; font-weight: 600; font-size: 17px; ">Journey</span>
				<span style="display: block; font-weight: 500; font-size: 17px; word-spacing: -3px;">in my room</span>
			</h2>
		</div>
		<!-- 포스터 목록 -->
		<div>
			<div id="contents" style="display:none;" >
				<div>
					<ul id="productList">
						<c:forEach var="image" items="${convertedImages}" varStatus="status" begin="0" end="20">
							<li>
								<a class="totalProduct" href="javascript:void(0)" onclick="">
									<div class="thumbnail">
										<img class="imgOnList mb-3" alt="123" src="data:image/jpeg;base64, ${image}">
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
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>