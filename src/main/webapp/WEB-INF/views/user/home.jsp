<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- home 스타일 설정을 위한 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<!-- Loading 화면 코드 시작 -->

<script type="text/javascript">
	 $(window).on('load', function () {
	      $("#load").hide();
	 });
	</script>
	<style type="text/css">
	#load {
	   width: 100%;
	   height: 100%;
	   top: 0;
	   left: 0;
	   position: fixed;
	   display: block;
	  /*  opacity: 0.8; */
	   background: white;
	   z-index: 99;
	   text-align: center;
	}
	
	#load > img {
	   position: absolute;
	   top: 50%;
	   left: 50%;
	   z-index: 100;
	}
</style>

<div id="load">
   <img src="${pageContext.request.contextPath}/resources/images/spinner.gif" style="background-color: white;" alt="loading">
</div>
<!-- Loading 화면 코드 종료-->

<script>
	$(init);
	
	var currentMainCategory = '${currentMainCategory}';
	var currentSubCategory = '${currentSubCategory}';
	
	var entireHtml = '<li><a style="visibility:hidden;" href="javascript:void(0)" onclick="">0</a></li>';
	var themeHtml = '';
	themeHtml += '<li><a href="?productTheme=wave&productArtist=&pageNo=1#menuArea" id="wave">wave</a></li>';
	themeHtml += '<li><a href="?productTheme=forest&productArtist=&pageNo=1#menuArea" id="forest">forest</a></li>';
	themeHtml += '<li><a href="?productTheme=window&productArtist=&pageNo=1#menuArea" id="window">window</a></li>';
	themeHtml += '<li><a href="?productTheme=life&productArtist=&pageNo=1#menuArea" id="life">life</a></li>';
	var artistHtml = '';
	artistHtml += '<li><a href="?productTheme=&productArtist=유래혁&pageNo=1#menuArea" id="유래혁">유래혁</a></li>';
	artistHtml += '<li><a href="?productTheme=&productArtist=문예진&pageNo=1#menuArea" id="문예진">문예진</a></li>';
	artistHtml += '<li><a href="?productTheme=&productArtist=other&pageNo=1#menuArea" id="other">other</a></li>';
		
	
	function init() {
		const $frame = $("#frame");

		$(document).on("mousemove", function(e) {
			
			var offsetX = e.clientX;
			var offsetY = e.clientY;
			
			var centerX = $frame.offset().left + $frame.width() / 2;
			var centerY = $frame.offset().top + $frame.height() / 2;
			
			var distanceX = (centerX - offsetX) *2;
			var distanceY = (centerY - offsetY) *2;
			
			var shadowX = distanceX / centerX * 10;
			var shadowY = distanceY / centerY * 10;
			
			
			var ceilShadowX = Math.ceil(shadowX);
			var ceilShadowY = Math.ceil(shadowY);
			
			console.log("shadowX:  " + ceilShadowX);
			console.log("shadowY:  " + ceilShadowY);
			
			$frame.css("box-shadow", "rgba(0, 0, 0, 0.6) " + ceilShadowX + "px " + ceilShadowY + "px 20px"  );
			
		});
		
		
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
		
		//$(".navbar").css('background','')
		
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
		
		console.log(currentMainCategory);
		console.log(currentSubCategory);
		
		if (currentMainCategory == 'entire') {
			$('#subCategory').html(entireHtml);
		} else if (currentMainCategory == 'theme') {
			$('#subCategory').html(themeHtml);
		} else if (currentMainCategory == 'artist') {
			$('#subCategory').html(artistHtml);
		}
		
		$('#subCategory li a').css('color', 'darkgray');
		$('#mainCategory h2 span a').css('color', 'darkgray');
		$('#'+currentMainCategory).css('color', 'black');
		$('#'+currentSubCategory).css('color', 'black');
		
/* 		//scroll 위치 기억
		function memorizeScroll() {
			 var strCook = document.cookie;
			 if(strCook.indexOf("!~")!=0) {
				 var intS = strCook.indexOf("!~");
				 var intE = strCook.indexOf("~!");
				 var strPos = strCook.substring(intS+2,intE);

				$("#contents").scrollTop() = strPos;
			}
		} */
	}
	
	function selectEntire() {
		$('#mainCategory h2 span a').css('color', 'darkgray');
		$('#entire').css('color', 'black');
		$('#subCategory').html(entireHtml);
	}
	
	function selectTheme() {
		$('#mainCategory h2 span a').css('color', 'darkgray');
		$('#theme').css('color', 'black');
		$('#subCategory').html(themeHtml);
		$('#subCategory li a').css('color', 'darkgray');
		$('#'+currentSubCategory).css('color', 'black');
	}
	
	function selectArtist() {
		$('#mainCategory h2 span a').css('color', 'darkgray');
		$('#artist').css('color', 'black');
		$('#subCategory').html(artistHtml);
		$('#subCategory li a').css('color', 'darkgray');
		$('#'+currentSubCategory).css('color', 'black');
	}
	
/* 	//저장된 scroll 위치로 이동
	function SetPosition() {
		 var intY = $("#contents").scrollTop();
		 document.title = intY;
		 document.cookie = "yPos=!~" + intY + "~!";
	} */
</script>

<%-- home.jsp의 중앙내용 --%>
<div id="wrapper">
	<div id="container">
		<!-- 메인 포스터 -->
		<div id="main-poster" class="container-fluid" style="background-color: #F4F4F4; background-image: url('${pageContext.request.contextPath}/resources/images/main5.jpg'); " >
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
		<%--<div id="slogan" style="padding: 42px 13px 100px;"> 
			<h2 style="text-align: center; ">
				<span style="display: block; font-weight: 600; font-size: 17px; ">Journey</span>
				<span style="display: block; font-weight: 500; font-size: 17px; word-spacing: -3px;">in my room</span>
			</h2>
		</div> --%>
		
		<!-- 포스터 목록 -->
		<div>
			<div id="contents" style="display: d-none" onscroll="SetPosition()">
				<div id="menuArea">
					<div id="mainCategory">
						<h2>
							<span><a id="entire" href="?productTheme=&productArtist=&pageNo=1#menuArea">전체</a></span>
							<span><a id="theme" href="javascript:void(0)" onclick="selectTheme(); return false;">테마</a></span>
							<span><a id="artist" href="javascript:void(0)" onclick="selectArtist(); return false;">아티스트</a></span>
						</h2>
					</div>
					<ul id="subCategory">
						
					</ul>
				</div>
				<div>
					<ul id="productList">
						<c:forEach var="image" items="${convertedImages}" varStatus="status" begin="0" end="20">
							<li>
								<a class="totalProduct" href="javascript:void(0)" onclick="" style="text-decoration:none;">
									<div class="thumbnail">
										<img class="imgOnList mb-3" alt="123" src="data:image/jpeg;base64, ${image}">
										<div class="productDetail">
											<div class="productDetailDiv" style="display:block;">
												<div class="productDetailDiv2">
													<div class="currentProductId" style="display:none">${productList[status.index].productId}</div>
													<div class="d-flex justify-content-start" style="font-size:16px;">${productList[status.index].productName}</div>
													<br>
													<div class="d-flex justify-content-start" style="white-space: pre-line; line-height: 1.3">
														${productList[status.index].productDetail}
													</div>
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
					   href="?productTheme=${productBoardSearch.productTheme}&
							productArtist=${productBoardSearch.productArtist}&
							pageNo=1#menuArea">first</a>
					<c:if test="${pager.groupNo>1}">
						<a class="text-dark mr-2" style="font-weight:600;" 
						   href="?productTheme=${productBoardSearch.productTheme}&
								productArtist=${productBoardSearch.productArtist}&
								pageNo=${pager.startPageNo-1}#menuArea">prev</a>
					</c:if>
					
					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
						<c:if test="${pager.pageNo != i}">
							<a class="text-dark" style="font-weight:600; padding:0 2px 0 2px;" 
							   href="?productTheme=${productBoardSearch.productTheme}&
									productArtist=${productBoardSearch.productArtist}&
									pageNo=${i}#menuArea">${i}</a>
						</c:if>
						<c:if test="${pager.pageNo == i}">
							<a class="text-dark" style="font-weight:600; padding:0 2px 0 2px; text-decoration:underline;" 
							   href="?productTheme=${productBoardSearch.productTheme}&
									productArtist=${productBoardSearch.productArtist}&
									pageNo=${i}#menuArea">${i}</a>
						</c:if>
					</c:forEach>
								
					<c:if test="${pager.groupNo<pager.totalGroupNo}">
						<a class="text-dark ml-2" style="font-weight:600;" 
						   href="?productTheme=${productBoardSearch.productTheme}&
								productArtist=${productBoardSearch.productArtist}&
								pageNo=${pager.endPageNo+1}#menuArea">next</a>
					</c:if>
					<a class="text-dark ml-2" style="font-weight:600;" 
					   href="?productTheme=${productBoardSearch.productTheme}&
							productArtist=${productBoardSearch.productArtist}&
							pageNo=${pager.totalPageNo}#menuArea">last</a>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>