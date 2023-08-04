<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- home 스타일 설정을 위한 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">

<%-- home.jsp의 중앙내용 --%>
<div>
	<div>
		<!-- 메인 포스터 -->
		<div id="main-poster" class="container-fluid" style="background-color: #F4F4F4; min-height: 1084px;" >
			<div id="frame" style="background-image: url('${pageContext.request.contextPath}/resources/images/poster3.jpg');">
				<img id="frame-image" alt="프레임" src="${pageContext.request.contextPath}/resources/images/frame.png" width="450px" height="630px";>
			</div>
		</div>
		<!-- 감성 글귀-->
		<div style="min-height: 542px; display:flex;">
			<div id="wrap" >
				<span class="mb-3" style="display: block; font-size: 72px; font-weight: 600; line-height: 1.1">poster</span>
				<span class="mb-3" style="display: block; font-size: 72px">the most beautiful tool</span>
				<span class="mb-3" style="display: block; font-size: 72px">to start a journey</span>
				<span class="mb-3" style="display: block; font-size: 72px; text-align: right;">&copy;2023</span>
			</div>
		</div>
		<!-- 슬로건 -->
		<div id="slogan" style="padding: 42px 13px 100px;">
			<h2 style="text-align: center; font-size: 17px;">
				<span style="display: block; font-weight: 600">Journey</span>
				<span style="display: block; font-weight: 500">in my room</span>
			</h2>
		</div>
		<!-- 포스터 목록 -->
		<div id="poster-list" style="display: flex; flex-direction:column; flex-wrap: wrap; max-width:1080px; margin: 0 auto" >
			<div class="poster-item">
				<div class="poster" style="width: 330px;">
					<a href="#"><img class="poster-image" alt="123" src="data:${productImage.productImageType};base64, ${base64Img}"></a>
				</div>
				<div class="mt-3">${productName}</div>
			</div>
			<div class="poster-item">
				<div class="poster" style="width: 330px;">
					<a href="#"><img class="poster-image" alt="" src="${pageContext.request.contextPath}/resources/images/poster2.jpg"></a>
				</div>
				<div class="mt-3"> 포스터 이름 </div>
			</div>
			<div class="poster-item">
				<div class="poster" style="width: 330px;">
					<a href="#"><img class="poster-image" alt="" src="${pageContext.request.contextPath}/resources/images/poster3.jpg"></a>
				</div>
				<div class="mt-3"> 포스터 이름 </div>
			</div>
			<div class="poster-item">
				<div class="poster" style="width: 330px;">
					<a href="#"><img class="poster-image" alt="" src="${pageContext.request.contextPath}/resources/images/poster2.jpg"></a>
				</div>
				<div class="mt-3"> 포스터 이름 </div>
			</div>
			<div class="poster-item">
				<div class="poster" style="width: 330px;">
					<a href="#"><img class="poster-image" alt="" src="${pageContext.request.contextPath}/resources/images/poster3.jpg"></a>
				</div>
				<div class="mt-3"> 포스터 이름 </div>
			</div>
			<div class="poster-item">
				<div class="poster" style="width: 330px;">
					<a href="#"><img class="poster-image" alt="" src="${pageContext.request.contextPath}/resources/images/poster2.jpg"></a>
				</div>
				<div class="mt-3"> 포스터 이름 </div>
			</div>
			<div class="poster-item">
				<div class="poster" style="width: 330px;">
					<a href="#"><img class="poster-image" alt="" src="${pageContext.request.contextPath}/resources/images/poster2.jpg"></a>
				</div>
				<div class="mt-3"> 포스터 이름 </div>
			</div>
			<div class="poster-item">
				<div class="poster" style="width: 330px;">
					<a href="#"><img class="poster-image" alt="" src="${pageContext.request.contextPath}/resources/images/poster2.jpg"></a>
				</div>
				<div class="mt-3"> 포스터 이름 </div>
			</div>
			<div class="poster-item">
				<div class="poster" style="width: 330px;">
					<a href="#"><img class="poster-image" alt="" src="${pageContext.request.contextPath}/resources/images/poster3.jpg"></a>
				</div>
				<div class="mt-3"> 포스터 이름 </div>
			</div>
			<div class="poster-item">
				<div class="poster" style="width: 330px;">
					<a href="#"><img class="poster-image" alt="" src="${pageContext.request.contextPath}/resources/images/poster2.jpg"></a>
				</div>
				<div class="mt-3"> 포스터 이름 </div>
			</div>
			<div class="poster-item">
				<div class="poster" style="width: 330px;">
					<a href="#"><img class="poster-image" alt="" src="${pageContext.request.contextPath}/resources/images/poster1.jpg"></a>
				</div>
				<div class="mt-3"> 포스터 이름 </div>
			</div>
			<div class="poster-item">
				<div class="poster" style="width: 330px;">
					<a href="#"><img class="poster-image" alt="" src="${pageContext.request.contextPath}/resources/images/poster2.jpg"></a>
				</div>
				<div class="mt-3"> 포스터 이름 </div>
			</div>
			<div class="poster-item">
				<div class="poster" style="width: 330px;">
					<a href="#"><img class="poster-image" alt="" src="${pageContext.request.contextPath}/resources/images/poster1.jpg"></a>
				</div>
				<div class="mt-3"> 포스터 이름 </div>
			</div>
			
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>