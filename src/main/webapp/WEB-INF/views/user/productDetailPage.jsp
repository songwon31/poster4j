<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%-- 공통 스타일 설정을 위한  css--%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/productDetailPageStyle.css"/>

<%-- 아이콘 라이브러리 --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script>
	var index = 0;
</script>

<div class="wrapper">
	<div class="productDetailContent d-flex flex-column align-items-center">
		<h2 id="productTitle">${product.productName}</h2>
		<img id="productImage" src="data:image/jpeg;base64, ${convertedImage}"/>
		<%-- 상품 정보 테이블 --%>
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
					<select name="selectSize" onchange="selectOption()">
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
					<select name="selectFrame" onchange="selectOption()">
						<option>--옵션을 선택해주세요--</option>
						<option value="선택안함">선택안함</option>
						<option value="black">black</option>
						<option value="silver">silver</option>
						<option value="white">white</option>
						<option value="gold">gold</option>
					</select>
				</td>
			</tr>
		</table>
		
		<%-- 선택상품 리스트 --%>
		<table id="selectedItemTable">
		</table>
		
		<%-- 총 가격 --%>
		<div class="totalPrice"></div>
		
		<%-- 장바구니 추가 / 바로 주문 버튼 --%>
		<div class="btnGroup d-flex">
			<a class="btn" href="addCart">Add to Cart</a>
			<a class="btn" href="orderNow">Order Now</a>
		</div>
		
		<%-- 상세설명 이미지 리스트 --%>
		<div class="explainImageList d-flex flex-column align-items-center">
			<c:forEach var="image" items="${convertedImages}">
				<img class="explainImage" src="data:image/jpeg;base64, ${image}"/>
			</c:forEach>
		</div>
	</div>
</div>
<script>
	//옵션선택시 선택된 아이템 표시
	function selectOption() {
		$.ajax({
			type: "POST",
			url: "/poster4j/addOrderList",
			success: function(data) {
				var seletedSize = $("select[name=selectSize] option:selected").val();				
				var seletedFrame = $("select[name=selectFrame] option:selected").val();
				
				if(seletedSize == null || seletedFrame == null || seletedSize == "--옵션을 선택해주세요--" || seletedFrame == "--옵션을 선택해주세요--") {
					alert("옵션을 선택해주세요.");
				} else {
					var html = "";
					html += '<tr>';
					html += '	<td>';
					html += '		<p>';
					html += '			${product.productName}';
					html += '			<input type="hidden" id="productId' + index + '" name="orderItemList[' + index + '].productId" value="productId">';
					html += '			<input type="hidden" id="productSize' + index + '" name="orderItemList[' + index + '].productSize" value="productSize">';
					html += '			<span>' + $("select[name=selectSize] option:selected").val() + '</span>';
					html += '			<input type="hidden" id="productFrame' + index + '" name="orderItemList[' + index + '].productFrame" value="productFrame">';
					html += '			<span>' + $("select[name=selectFrame] option:selected").val() + '</span>';
					html += '		</p>';
					html += '	</td>';
					html += '	<td>';
					html += '		<span>';
					html += '		<a onclick="minusQuantity()"><i class="fa fa-minus ml-5"></i></a>';
					html += '		<input type="text"  id="productQuantity' + index + '" name="orderItemList[' + index + '].productQuantity" size="1" min="1" style="text-align: center; border-bottom: none;" value=1>';
					html += '		<a onclick="plusQuantity()"><i class="fa fa-plus"></i></a>';
					html += '		</span>';
					html += '	</td>';
					html += '	<td>';
					html += '		<a><i class="material-icons ml-5" style="font-weight: bold; font-size: 18px;">clear</i></a>';
					html += '	</td>';
						
					$("#selectedItemTable").append(html);
					
					index++;
				}
			}
		});
	}
	
	//아이템 수량 감소
	function minusQuantity() {
		var presentValue = parseInt($(event.target).parent().next().val());
		if(presentValue == 0) {
			//delete
		} else {
			$(event.target).parent().next().val(presentValue - 1);
		}
	}
	
	//아이템 수량 추가
	function plusQuantity() {
		var presentValue = parseInt($(event.target).parent().prev().val());
		$(event.target).parent().prev().val(presentValue + 1);
	}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>