<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- home 스타일 설정을 위한 css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">

<%-- home.jsp의 중앙내용 --%>
<div>
	<div>
	
		<!-- 메인 포스터 -->
		<div id="main-poster" class="container-fluid" style="background-color: #F4F4F4; height: 1084px;" >
			<div id="frame" style="background-image: url('//postershop.kr/web/product/medium/202106/ca652c60857299dcbeb554c77a0f07c3.png');">
				<img alt="프레임" src="${pageContext.request.contextPath}/resources/images/frame.png" width="450px" height="630px";>
			</div>
		</div>
		<!-- 감성 글귀-->
		<div style="height: 1084px">
			<div id="wrap" >
				<span class="mb-3" style="display: block; font-size: 72px; font-weight: 600; line-height: 1.1">poster</span>
				<span class="mb-3" style="display: block; font-size: 72px">the most beautiful tool</span>
				<span class="mb-3" style="display: block; font-size: 72px"> to break walls</span>
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
	<%-- 	<div style="display: flex; flex-direction:column; flex-wrap: wrap; width:1080px; height: 2000px; margin: 0 auto" >
			<div style="width: 351.1px; margin: 0 auto">
				<div>
					<img alt="" src="${pageContext.request.contextPath}/resources/images/poster1.jpg" width="351.1px">
				</div>
				<div> 포스터 이름 </div>
			</div>
		</div> --%>
		<ul class="" style="display: flex; flex-direction:column; flex-wrap: wrap; width:1080px; height: 2000px; margin: 0 auto">
			<li class="" style= "width: 351.1px">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/poster1.jpg" width="330px">
				<div> 포스터 이름 </div>
			</li>
			<li class="" style= "width: 351.1px">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/poster1.jpg" width="330px">
				<div> 포스터 이름 </div>
			</li>
			<li class="" style= "width: 351.1px">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/poster1.jpg" width="330px">
				<div> 포스터 이름 </div>
			</li>
			<li class="" style= "width: 351.1px">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/poster1.jpg" width="330px">
				<div> 포스터 이름 </div>
			</li>
			<li class="" style= "width: 351.1px">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/poster1.jpg" width="330px">
				<div> 포스터 이름 </div>
			</li>
			<li class="" style= "width: 351.1px">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/poster1.jpg" width="330px">
				<div> 포스터 이름 </div>
			</li>
			<li class="" style= "width: 351.1px">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/poster1.jpg" width="330px">
				<div> 포스터 이름 </div>
			</li>
		</ul>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>