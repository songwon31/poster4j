<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- home 스타일 설정을 위한 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<script>
	$(init);
	
	function init() {
		$(window).resize(function() {
			var innerWidth = window.innerWidth;
			var productList = $("#productList");
			if (innerWidth > 1024) {
				productList.css("column-count", 3);
			} else if (innerWidth > 768) {
				productList.css("column-count", 2);
			} else {
				productList.css("column-count", 1);
			}
		});
		
		$(".navbar").css('background','')
	}
</script>

<%-- home.jsp의 중앙내용 --%>
<div id="wrapper">
	<div id="container">
		<!-- 메인 포스터 -->
		<div id="main-poster" class="container-fluid" style="background-color: #F4F4F4; min-height: 1084px;" >
			<div id="frame" style="background-image: url('data:image/jpeg;base64, ${randomImage}');">
				<img id="frame-image" alt="프레임" src="${pageContext.request.contextPath}/resources/images/frame.png" width="450px" height="630px";>
			</div>
		</div>
		<!-- 감성 글귀-->
		<div style="min-height: 542px; display:flex; padding-left: 30px; padding-right: 30px;">
			<div id="wrap">
				<span class="mb-3" style="display: block; font-size: 72px; font-weight: 600; line-height: 1.1">poster</span>
				<span class="mb-3" style="display: block; font-size: 72px; word-spacing: -10px;">the most beautiful tool</span>
				<span class="mb-3" style="display: block; font-size: 72px; word-spacing: -10px;">to start a journey</span>
				<span class="mb-3" style="display: block; font-size: 72px; text-align: right;">&copy;2023</span>
			</div>
		</div>
		<!-- 슬로건 -->
		<div id="slogan" style="padding: 42px 13px 100px;"> 
			<h2 style="text-align: center; ">
				<span style="display: block; font-weight: 600; font-size: 17px; ">Journey</span>
				<span style="display: block; font-weight: 500; font-size: 17px; word-spacing: -3px;">in my room</span>
			</h2>
		</div>
		<!-- 포스터 목록 -->
		<div>
			<div id="contents" >
				<ul id="productList">
					<c:forEach var="image" items="${convertedImages}" varStatus="status" begin="0" end="3">
						<li class="poster">
							<div class="thumbnail">
								<a href="productDetail?productId=${productList[status.index].productId}">
									<img class="imgOnList" alt="123" src="data:image/jpeg;base64, ${image}">
									<div class="mt-3" style="margin-bottom: 30px; color: black;">[${productList[status.index].productTheme}] ${productList[status.index].productName}</div>
								</a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>