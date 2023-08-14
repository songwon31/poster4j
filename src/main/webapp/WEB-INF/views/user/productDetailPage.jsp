<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<%-- 공통 스타일 설정을 위한  css--%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/productDetailPageStyle.css" />

<%-- 아이콘 라이브러리 --%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<script>
	//선택된 아이템 리스트 인덱싱을 위한 배열
	var check=[];
	
	//선택된 아이템 총가격
	var totalPrice = 0;
</script>

<div class="wrapper">
	<div class="productDetailContent d-flex flex-column align-items-center">
		<h2 id="productTitle">${product.productName}</h2>
		<img id="productImage" src="data:image/jpeg;base64, ${convertedImage}" />
		<%-- 상품 정보 테이블 --%>
		<h3 id="productName">${product.productName}</h3>
		<input id="productId" name="productId" type="hidden"
			value="${product.productName}" form="selectedItemForm">
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

		<%-- 선택상품 총 가격 --%>
		<div id="totalPriceGroup" class="d-flex m-3">
			<span class="mr-2">KRW</span>
			<span id="totalPrice"></span>
		</div>

		<%-- 장바구니 추가 / 바로 주문 버튼 --%>
		<div class="btnGroup d-flex">
			<a class="btn mx-1" href="javascript:void(0)" onclick="addCart();return false;">Add to Cart</a>
			<a class="btn mx-1" href="javascript:void(0)" onclick="orderNow();return false;">Order Now</a>
		</div>

		<%-- 상세설명 이미지 리스트 --%>
		<div class="explainImageList d-flex flex-column align-items-center">
			<c:forEach var="image" items="${convertedImages}">
				<img class="explainImage" src="data:image/jpeg;base64, ${image}" />
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
					//alert("옵션을 선택해주세요.");
				} else {
					let i=0;
					let index = 0;
					if (check.length == 0) {
						index = 0;
						check.push(1);
					} else {
						for (i=0; i < check.length; ++i) {
							if (check[i] == 0) {
								index = i;
							}
						}
						if (i == check.length) {
							check.push(1);
							index = i;
						}
					}
					
					var html = "";
					html += '<tr id="tr' + index + '">';
					html += '	<form id="selectedItemForm" method="POST">';
					html += '	<td>';
					html += '		<p>';
					html += '			${product.productName}';
					html += '			<input type="hidden" id="productId' + index + '" name="orderItemList[' + index + '].productId" value="${product.productId}">';
					html += '			<input type="hidden" id="productSize' + index + '" name="orderItemList[' + index + '].productSize" value="' + seletedSize + '">';
					html += '			<span>' + $("select[name=selectSize] option:selected").val() + '</span>';
					html += '			<input type="hidden" id="productFrame' + index + '" name="orderItemList[' + index + '].productFrame" value="' + seletedFrame + '">';
					html += '			<span>' + $("select[name=selectFrame] option:selected").val() + '</span>';
					html += '		</p>';
					html += '	</td>';
					html += '	<td>';
					html += '		<span>';
					html += '			<a onclick="minusQuantity('+ index +')"><i class="fa fa-minus ml-5"></i></a>';
					html += '			<input type="text"  id="productQuantity' + index + '" name="orderItemList[' + index + '].productQuantity" size="1" min="1" style="text-align: center; border-bottom: none;" value=1>';
					html += '			<a onclick="plusQuantity('+ index +')"><i class="fa fa-plus mr-5"></i></a>';
					html += '		</span>';
					html += '	</td>';
					html += '	<td>';
					html += '		<span id="selectedItemPrice' + index + '" class="selectedItemPrice mr-5"><fmt:formatNumber value="${discountedPrice}" pattern="#,###" /></span>';
					html += '	</td>';
					html += '	<td>';
					html += '		<a href="javascript:void(0)" onclick="deleteSelectedItem('+ index +');return false;"><i class="material-icons" style="font-weight: bold; font-size: 18px;">clear</i></a>';
					html += '	</td>';
					html += '	</form>';
					html += '</tr>';
						
					$("#selectedItemTable").append(html);
					
					//선택된 아이템 총가격 계산
					let selectedPrice = $("#selectedItemPrice" + index).text();
					let parsedSelectedPrice = parseInt(selectedPrice.replace(/[^0-9]/g, ""));
					totalPrice += parsedSelectedPrice;
					$("#totalPrice").text(totalPrice.toLocaleString("ko-KR"));
					
					index++;
				}
			}
		});
	}
	
	//아이템 수량 감소
	function minusQuantity(index) {
		var presentQuantity =parseInt($("#productQuantity" + index).val());
		if(presentQuantity == 1) {
			deleteSelectedItem(index);
		} else {
			var newQuantity = $("#productQuantity" + index).val(presentQuantity - 1).val();
			
			//수량감소시 옵션별 총가격
			var presentPrice = $("#selectedItemPrice" + index).text();
			var parsedPresentPrice = parseInt(presentPrice.replace(/[^0-9]/g, ""));
			var optionItemPrice = (parsedPresentPrice/presentQuantity) * newQuantity;
			
			$("#selectedItemPrice" + index).text(optionItemPrice.toLocaleString("ko-KR"));
			
			//수량감소시 선택된 아이템 총가격 변경
			totalPrice -= parsedPresentPrice;
			$("#totalPrice").text(totalPrice.toLocaleString("ko-KR"));
		}
	}
	
	//아이템 수량 추가
	function plusQuantity(index) {
		var presentQuantity = parseInt($("#productQuantity" + index).val());
		var newQuantity = $("#productQuantity" + index).val(presentQuantity + 1).val();
		
		//수량추가시 옵션별 총가격
		var presentPrice = $("#selectedItemPrice" + index).text();
		var parsedPresentPrice = parseInt(presentPrice.replace(/[^0-9]/g, ""));
		var optionItemPrice = (parsedPresentPrice/presentQuantity) * newQuantity;
		
		$("#selectedItemPrice" + index).text(optionItemPrice.toLocaleString("ko-KR"));
		
		//수량추가시 선택된 아이템 총가격 변경
		totalPrice += parsedPresentPrice;
		$("#totalPrice").text(totalPrice.toLocaleString("ko-KR"));
	}
	
	//아이템 삭제
	function deleteSelectedItem(index) {
		$("#tr" + index).remove();
		check[index] = 0;
	}
	
	//장바구니에 담기
	function addCart() {
		var orderItemList = new Array();
		for (let i = 0; i < check.length; i++) {
			if (check[i]) {
				let orderItem = {
					productId : $("#productId" + i).val(),
					customerId : "",
					productQuantity : parseInt($("#productQuantity" + i).val()),
					productSize : $("#productSize" + i).val(),
					productFrame : $("#productFrame" + i).val()
				};
				orderItemList.push(orderItem);
			}
		}

		$.ajax({
			type : "POST",
			url : "/poster4j/saveCart",
			contentType: "application/json",
		    data: JSON.stringify(orderItemList),
			success : function(data) {
				//장바구니에 담은 아이템들 다 지워주기
				for (let i = 0; i < check.length; i++) {
					if (check[i]) {
						deleteSelectedItem(i);
					}
				}
				//선택된 아이템 리스트 인덱싱을 위한 배열 초기화
				check = [];
			}
		});
	}

	//바로 주문하기
	function orderNow() {
		$.ajax({
			type : "POST",
			url : "/poster4j/getCustomerId",
			success: function(data) {
				var form = document.createElement("form");
				form.setAttribute("charset", "UTF-8");
		        form.setAttribute("method", "Post");  //Post 방식
		        form.setAttribute("action", "/poster4j/order"); //요청 보낼 주소
				
		        var hiddenField;
		        
				for (let i = 0; i < check.length; i++) {
					if (check[i]) {
						hiddenField = document.createElement("input");
						hiddenField.setAttribute("type", "hidden");
					    hiddenField.setAttribute("name", "orderItemList["+i+"].custormerId");
					    hiddenField.setAttribute("value", data);
					    form.appendChild(hiddenField);
						
					    hiddenField = document.createElement("input");
						hiddenField.setAttribute("type", "hidden");
					    hiddenField.setAttribute("name", "orderItemList["+i+"].productId");
					    hiddenField.setAttribute("value", $("#productId" + i).val());
					    form.appendChild(hiddenField);
					    
					    hiddenField = document.createElement("input");
						hiddenField.setAttribute("type", "hidden");
					    hiddenField.setAttribute("name", "orderItemList["+i+"].productQuantity");
					    hiddenField.setAttribute("value", $("#productQuantity" + i).val());
					    form.appendChild(hiddenField);
					    
					    hiddenField = document.createElement("input");
						hiddenField.setAttribute("type", "hidden");
					    hiddenField.setAttribute("name", "orderItemList["+i+"].productSize");
					    hiddenField.setAttribute("value", $("#productSize" + i).val());
					    form.appendChild(hiddenField);
					    
					    hiddenField = document.createElement("input");
						hiddenField.setAttribute("type", "hidden");
					    hiddenField.setAttribute("name", "orderItemList["+i+"].productFrame");
					    hiddenField.setAttribute("value",  $("#productFrame" + i).val());
					    form.appendChild(hiddenField);
					}
				}
				document.body.appendChild(form);
				form.submit();
			}
		});
	}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>