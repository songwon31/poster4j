<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cartStyle.css"/>

<div class="wrapper">
	<div id="container">
		<div id="contents">
			<div id="cart-body">
				<form method="post" action="cart">
					<ul>
						<li>
							<input type="text" name="productId" value="1"/>
							<input type="text" name="customerId" value="1"/>
							<input type="text" name="productQuantity" value="1"/>
							<input type="text" name="productId" value="1"/>
							<input type="text" name="productId" value="1"/>
						</li>
					</ul>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>