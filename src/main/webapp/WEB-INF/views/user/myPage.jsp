<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPageStyle.css"/>

<div class="wrapper">
	<div class="myPageContent d-flex justify-content-center">
		<ul class="myPageList d-flex flex-column align-items-center">
			<li>
				<a class="logoutLink" href="logout">Logout</a>
			</li>
			<li>
				<a class="addressLink" href="addressList">Address</a>
			</li>
		</ul>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>