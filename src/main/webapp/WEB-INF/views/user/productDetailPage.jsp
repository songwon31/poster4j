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
		<div class="productWrapper d-flex justify-content-center row">
			<%-- 상품 대표 이미지 --%>
			<img id="productImage" class="col" src="data:image/jpeg;base64, ${convertedImage}" />
			
			<%-- 상품 정보 및 선택란 --%>
			<div id="productInfoAndSelect" class="col">
				<%-- 상품 정보 테이블 --%>
				<table id="productDetailTable">
					<thead>
						<h3 id="productName">${product.productName}</h3>
						<input id="productId" name="productId" type="hidden" value="${product.productId}" form="selectedItemForm">
					</thead>
					<tbody>
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
					</tbody>
				</table>
		
				<%-- 선택상품 리스트 --%>
				<table id="selectedItemTable">
				</table>
		
				<%-- 선택상품 총 가격 --%>
				<div id="totalPriceGroup" class="d-flex justify-content-right mr-1">
					<span class="mr-2">KRW</span>
					<span id="totalPrice"></span>
				</div>
		
				<%-- 장바구니 추가 / 바로 주문 버튼 --%>
				<div class="btnGroup d-flex">
					<a class="eventBtn btn px-5 py-2" href="javascript:void(0)" onclick="addCart();return false;">Add to Cart</a>
					<a class="eventBtn btn ml-2 px-5 py-2" href="javascript:void(0)" onclick="orderNow();return false;">Order Now</a>
				</div>
			</div>
		</div>

		<%-- 상세설명 이미지 리스트 --%>
		<div id="explainImageList" class="d-flex flex-column align-items-center">
			<c:forEach var="image" items="${convertedImages}">
				<img class="explainImage" src="data:image/jpeg;base64, ${image}" />
			</c:forEach>
		</div>
			
		<%-- 상품상세 공통 이미지 frameDetail --%>
		<div id="frameDetailWrapper" class="d-flex justify-content-center"> 
			<img id="frameDetail" src="data:image/jpeg;base64, ${frameDetail}" />
		</div>
		
		<%-- 리뷰 게시판 보기 --%>
		<div id="reviewBoard">
			<h3 id="reviewBoardTitle">REVIEW</h3>
			<c:forEach var="review" items="${reviews}">
				<div class="reviewBoardItem">
					<div>${product.productName} ${review.optionSize} ${review.optionFrame}</div>
					<div class="mt-3">
						<c:if test="${review.reviewStarRating==5}">
							<span class="star">★★★★★</span>
						</c:if>
						<c:if test="${review.reviewStarRating==4}">
							<span class="star">★★★★</span>
						</c:if>
						<c:if test="${review.reviewStarRating==3}">
							<span class="star">★★★</span>
						</c:if>
						<c:if test="${review.reviewStarRating==2}">
							<span class="star">★★</span>
						</c:if>
						<c:if test="${review.reviewStarRating==1}">
							<span class="star">★</span>
						</c:if>
					</div>
					<div class="reviewImageList d-flex mt-2">
						<c:forEach var="image" items="${convertedReviewImages}">
							<img class="reviewImage mx-1" src="data:image/jpeg;base64, ${image}" width="100px" height="100px" />
						</c:forEach>
					</div>
					<div class="mt-3">${review.reviewContent}</div>
					<div class="mt-3"><fmt:formatDate value="${review.reviewWrittenDate}" pattern="yyyy-MM-dd" /></div>
				</div>
			</c:forEach>
			<%-- 페이지 번호 --%>
			<div class="d-flex">
				<a class="text-dark mr-2" style="font-weight:600;"  href="getReviewList?pageNo=1">first</a>
				<c:if test="${reviewPager.groupNo>1}">
					<a class="text-dark mr-2" style="font-weight:600;"  href="getReviewList?pageNo=${reviewPager.startPageNo-1}">prev</a>
				</c:if>
				
				<c:forEach var="i" begin="${reviewPager.startPageNo}" end="${reviewPager.endPageNo}">
					<c:if test="${reviewPager.pageNo != i}">
						<a class="text-dark" style="font-weight:600; padding:0 2px 0 2px;" href="getReviewList?pageNo=${i}">${i}</a>
					</c:if>
					<c:if test="${reviewPager.pageNo == i}">
						<a class="text-dark" style="font-weight:600; padding:0 2px 0 2px; text-decoration:underline;" href="getReviewList?pageNo=${i}">${i}</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${reviewPager.groupNo<reviewPager.totalGroupNo}">
					<a class="text-dark ml-2" style="font-weight:600;" href="getReviewList?pageNo=${reviewPager.endPageNo+1}">next</a>
				</c:if>
				<a class="text-dark ml-2" style="font-weight:600;" href="getReviewList?pageNo=${reviewPager.totalPageNo}">last</a>
			</div>
		</div>
		
		<%-- QNA 게시판 --%>
		<table id="qnaBoard">
			<h3 id="qnawBoardTitle">QNA</h3>
			<c:forEach var="productInquiry" items="${productInquiries}">
				<tr class="qnaBoardItem">
					<td>${productInquiry.productInquiryContent}</td>
					<td>${productInquiry.customerId}</td>
					<td>${productInquiry.productInquiryDate}</td>
					<td></td>
					<td>
						<c:if test="${productInquiry.productInquiryAnswered==TRUE}">YES</c:if>
						<c:if test="${productInquiry.productInquiryAnswered==FALSE}">NO</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		<%-- 페이지 번호 --%>
		<div class="d-flex">
			<a class="text-dark mr-2" style="font-weight:600;"  href="getReviewList?pageNo=1">first</a>
			<c:if test="${qnaPager.groupNo>1}">
				<a class="text-dark mr-2" style="font-weight:600;"  href="getReviewList?pageNo=${qnaPager.startPageNo-1}">prev</a>
			</c:if>
			
			<c:forEach var="i" begin="${qnaPager.startPageNo}" end="${qnaPager.endPageNo}">
				<c:if test="${qnaPager.pageNo != i}">
					<a class="text-dark" style="font-weight:600; padding:0 2px 0 2px;" href="getReviewList?pageNo=${i}">${i}</a>
				</c:if>
				<c:if test="${qnaPager.pageNo == i}">
					<a class="text-dark" style="font-weight:600; padding:0 2px 0 2px; text-decoration:underline;" href="getReviewList?pageNo=${i}">${i}</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${qnaPager.groupNo<qnaPager.totalGroupNo}">
				<a class="text-dark ml-2" style="font-weight:600;" href="getReviewList?pageNo=${qnaPager.endPageNo+1}">next</a>
			</c:if>
			<a class="text-dark ml-2" style="font-weight:600;" href="getReviewList?pageNo=${qnaPager.totalPageNo}">last</a>
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
				var selectedSize = $("select[name=selectSize] option:selected").val();				
				var selectedFrame = $("select[name=selectFrame] option:selected").val();
				
				if(selectedSize == null || selectedFrame == null || selectedSize == "--옵션을 선택해주세요--" || selectedFrame == "--옵션을 선택해주세요--") {
					//alert("옵션을 선택해주세요.");
				} else {
					let isDuplicated = false;
					let duplicatedItemIndex = 0;
					
					//선택한 옵션이 이미 있는 옵션인지 조사
					$('.productSize').each(function(sizeIndex, sizeItem) {
						$('.productFrame').each(function (frameIndex, frameItem) {
							if (selectedSize == sizeItem.value && selectedFrame == frameItem.value) {
								isDuplicated = true;
								//해당 인덱스를 저장
								duplicatedItemIndex = frameIndex;
							}
						});
					});
					
					//선택한 옵션이 기존에 있던 옵션일 경우
					if (isDuplicated) {						
						//이미 선택한 옵션
					    let duplicatedQuantityInput = $("#productQuantity" + duplicatedItemIndex);
					    
					    //수량
					    let presentQuantity = parseInt(duplicatedQuantityInput.val());
					    let newQuantity = duplicatedQuantityInput.val(presentQuantity + 1).val();
					    
					    //옵션별 총가격 계산
					    var presentPrice = $("#selectedItemPrice" + duplicatedItemIndex).text();
						var parsedPresentPrice = parseInt(presentPrice.replace(/[^0-9]/g, ""));
						var optionItemPrice = (parsedPresentPrice/presentQuantity) * newQuantity;
						
						$("#selectedItemPrice" + duplicatedItemIndex).text(optionItemPrice.toLocaleString("ko-KR"));
					    
					    //선택된 아이템 총가격 계산
					    let selectedPrice = $("#selectedItemPrice" + duplicatedItemIndex).text();
					    let parsedSelectedPrice = parseInt(selectedPrice.replace(/[^0-9]/g, ""));
					    totalPrice += parsedSelectedPrice;
					    $("#totalPrice").text(totalPrice.toLocaleString("ko-KR"));
						
					} else {
						//선택한 옵션이 새로운 옵션일 경우
						let i = 0;
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
						html += '		<td>';
						html += '			<p>';
						html += '				${product.productName}';
						html += '				<input type="hidden" id="productId' + index + '" name="orderItemList[' + index + '].productId" value="${product.productId}">';
						html += '				<input  class="productSize" type="hidden" id="productSize' + index + '" name="orderItemList[' + index + '].productSize" value="' + selectedSize + '">';
						html += '				<span>' + $("select[name=selectSize] option:selected").val() + '</span>';
						html += '				<input class="productFrame" type="hidden" id="productFrame' + index + '" name="orderItemList[' + index + '].productFrame" value="' + selectedFrame + '">';
						html += '				<span>' + $("select[name=selectFrame] option:selected").val() + '</span>';
						html += '			</p>';
						html += '		</td>';
						html += '		<td>';
						html += '			<span>';
						html += '				<a onclick="minusQuantity('+ index +')"><i class="fa fa-minus ml-5"></i></a>';
						html += '				<input type="text" id="productQuantity' + index + '" name="orderItemList[' + index + '].productQuantity" size="1" min="1" style="text-align: center; border-bottom: none;" value=1>';
						html += '				<a onclick="plusQuantity('+ index +')"><i class="fa fa-plus mr-5"></i></a>';
						html += '			</span>';
						html += '		</td>';
						html += '		<td>';
						html += '			<span id="selectedItemPrice' + index + '" class="selectedItemPrice mr-5"><fmt:formatNumber value="${discountedPrice}" pattern="#,###" /></span>';
						html += '		</td>';
						html += '		<td>';
						html += '			<a href="javascript:void(0)" onclick="deleteSelectedItem('+ index +');return false;"><i class="material-icons" style="font-weight: bold; font-size: 18px;">clear</i></a>';
						html += '		</td>';
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
			}
		});
	}
	
	//아이템 수량 감소
	function minusQuantity(index) {
		var presentQuantity = parseInt($("#productQuantity" + index).val());
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
			totalPrice -= (parsedPresentPrice/presentQuantity);
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
		totalPrice += (parsedPresentPrice/presentQuantity);
		$("#totalPrice").text(totalPrice.toLocaleString("ko-KR"));
	}
	
	//아이템 삭제
	function deleteSelectedItem(index) {
		//아이템 삭제시 총가격 금액변경
		let deleteTargetPrice = parseInt($("#selectedItemPrice" + index).text().replace(/[^0-9]/g, ""));
		totalPrice -= deleteTargetPrice;
		$("#totalPrice").text(totalPrice.toLocaleString("ko-KR"));
		
		//해당 아이템 삭제하고 index배열 값 0으로 변경
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