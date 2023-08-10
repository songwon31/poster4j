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
					<ul id="newOrderItemList">
						<li>
							<input class="productId" type="text" name="productId" value="1"/>
							<input class="productName" type="text" name="customerId" value="1"/>
							<input class="productQuantity" type="text" name="productQuantity" value="1"/>
							<input class="productSize" type="text" name="productSize" value="1"/>
							<input class="productFrame" type="text" name="productFrame" value="1"/>
						</li>
						<li>
							<input class="productId" type="text" name="productId" value="2"/>
							<input class="productName" type="text" name="customerId" value="2"/>
							<input class="productQuantity" type="text" name="productQuantity" value="2"/>
							<input class="productSize" type="text" name="productSize" value="2"/>
							<input class="productFrame" type="text" name="productFrame" value="2"/>
						</li>
						<li>
							<input class="productId" type="text" name="productId" value="3"/>
							<input class="productName" type="text" name="customerId" value="3"/>
							<input class="productQuantity" type="text" name="productQuantity" value="3"/>
							<input class="productSize" type="text" name="productSize" value="3"/>
							<input class="productFrame" type="text" name="productFrame" value="3"/>
						</li>
					</ul>
					<a id="sendButton" onclick="send()" class="btn btn-sm btn-success">버튼</a>
				</form>
				<script>
					function send() {
						var orderItemList = [];
						$("#newOrderItemList li").each(function(index, li) {
							let data = {
									"productId" : $(li).children('.productId').attr('value'),
									"productName" : $(li).children('.productName').attr('value'),
									"productQuantity" : $(li).children('.productQuantity').attr('value'),
									"productSize" : $(li).children('.productSize').attr('value'),
									"productFrame" : $(li).children('.productFrame').attr('value'),
							};
							orderItemList.push(data);
						});
						
						$.ajax({
							url: 'cart',
							method: 'post',
							data: JSON.stringify(orderItemList),
							contentType: "application/json",
							success: function (response) {
		                        console.log("List sent successfully");
		                    }
						});
					}
				</script>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>