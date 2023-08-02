<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/views/common/header.jsp"%>

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
			<div id="wrap" style="margin: 0 135px">
				<span class="mb-3" style="display: block; font-size: 72px; font-weight: 600; line-height: 1.1">poster</span>
				<span class="mb-3" style="display: block; font-size: 72px">the most beautiful tool</span>
				<span class="mb-3" style="display: block; font-size: 72px"> to break walls</span>
				<span class="mb-3" style="display: block; font-size: 72px; text-align: right;">&copy;2023</span>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>