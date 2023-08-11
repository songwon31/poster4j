<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!-- 공통 스타일 설정을 위한  css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/productDetailPageStyle.css"/>

<!-- 아이콘 라이브러리 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<div class="wrapper">
	<div class="productDetailContent d-flex flex-column align-items-center">
		<h2 id="productTitle">${product.productName}</h2>
		<img id="productImage" src="data:image/jpeg;base64, ${convertedImage}"/>
		<form id="productDetailForm" method="post" action="addOrderList">
			<h3 id="productName">${product.productName}</h3>
			<input id="productId" name="productId" type="hidden" value="${product.productName}">
			<table class="productDetailTable mb-3">
				<tr class="priceGroup">
					<th>Price</th>
					<td>
						<span>KRW</span>
						<span><fmt:formatNumber value="${product.productPrice}" pattern="#,###" /></span>
					</td>
				</tr>
				<tr class="discountedPriceGroup">
					<th>Discounted Price</th>
					<td>
						<span>KRW</span>
						<span id="discountedPrice"><fmt:formatNumber value="${discountedPrice}" pattern="#,###" /></span>
						<span>(KRW</span>
						<span id="discountAmount"><fmt:formatNumber value="${discountAmount}" pattern="#,###" /></span>
						<span>할인)</span>
					</td>
				</tr>
				<tr class="sizeGroup">
					<th>Size</th>
					<td>
						<input id="productSize" name="productSize" type="hidden">
						<select name="selectSize">
							<option>--옵션을 선택해주세요--</option>
							<option value="297 x 420mm">297 x 420mm</option>
							<option value="420 x 594mm">420 x 594mm</option>
							<option value="500 x 700mm">500 x 700mm</option>
						</select>
					</td>
				</tr>
				<tr class="frameGroup">
					<th>Frame</th>
					<td>
						<input id="productFrame" name="productFrame" type="hidden">
						<select name="selectFrame">
							<option>--옵션을 선택해주세요--</option>
							<option value="noframe">선택안함</option>
							<option value="black">black</option>
							<option value="silver">silver</option>
							<option value="white">white</option>
							<option value="gold">gold</option>
						</select>
					</td>
				</tr>
			</table>
		</form>
		<!-- 선택상품 리스트 -->
		<table class="selectedItemTable">
			<c:forEach var="item" items="${orderItem}">
<%-- 							<tr>
					<td>
						<p> --%>
							<p>${item.productId}</p>
<%-- 							${product.productName}
							<span id="seletedSize"></span>
							<span id="seletedFrame"></span>
						</p>
					</td>
					<td>
						<span>
							<a><i class="fa fa-minus ml-5"></i></a>
							<input id="productQuantity" form="productDetailForm" name="productQuantity" type="text" size="1" min="1" style="text-align: center; border-bottom: none;" value=1></input>
							<a><i class="fa fa-plus"></i></a>
						</span>
					</td>
					<td>
						<a><i class="material-icons ml-5" style="font-weight: bold; font-size: 18px;">clear</i></a>
					</td>
				</tr> --%>
			</c:forEach>
		</table>
		<div class="totalPrice"></div>
		<div class="btnGroup d-flex">
			<a class="btn" href="addCart">Add to Cart</a>
			<a class="btn" href="orderNow">Order Now</a>
		</div>
		<!-- 상세설명 이미지 리스트 -->
		<div class="explainImageList d-flex flex-column align-items-center">
			<c:forEach var="image" items="${convertedImages}">
				<img class="explainImage" src="data:image/jpeg;base64, ${image}"/>
			</c:forEach>
		</div>
	</div>
</div>
<script>
	$("select[name=selectSize]")
	  .on("change", function() {
	    var str = "";
	    $("select[name=selectSize] option:selected").each(function() {
	      str += $(this).text();
	    });
	    $("#seletedSize").text(str);
	    $("#productSize").val(str);
	  });
	
	$("select[name=selectFrame]")
	  .on("change", function() {
	    var str = "";
	    $("select[name=selectFrame] option:selected").each(function() {
	      str += $(this).text();
	    });
	    $("#seletedFrame").text(str);
	    $("#productFrame").val(str);
	  });
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>