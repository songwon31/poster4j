<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div id="wrapper">
	<div id="container">
		<!-- 메인 포스터 -->
		<div id="main-poster" class="container-fluid" style="background-color: #F4F4F4; " >
			<div id="frame" style="background-image: url('data:image/jpeg;base64, ${randomImage}');">
				<img id="frame-image" alt="프레임" src="${pageContext.request.contextPath}/resources/images/frame.png" width="450px" height="630px;">
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>