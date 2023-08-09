<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchPageStyle.css"/>

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
	}
</script>

<div class="wrapper">
	<div id="container">
		<div id="contents">
			<div style="position:relative;">
				<ul id="productList">
					<c:forEach var="image" items="${convertedImages}" varStatus="status">
						<li>
							<div class="thumbnail">
								<a href="#"><img class="imgOnList" src="data:image/jpeg;base64, ${image}"></a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>