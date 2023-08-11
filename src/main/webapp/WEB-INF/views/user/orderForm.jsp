<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- OrderForm 스타일 설정을 위한 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderFormStyle.css">

<script type="text/javascript">
	var totalPrice = 0;
	var shipFee = 0;
	$(init);

	function init(){
		getFinalTotalPrice();
		getTotalPrice();	
		getShipFee();
	}
	function getShipFee(){
		if(totalPrice == 0){
			shipFee = 0;
		}else if(totalPrice < 50000){
			shipFee = 3000;
		}
		
		$("#shipFee").text(shipFee);
	}
	
	function showReceiverList(){
		$("#receiverInfo").hide();
		$("#receiverList").show();
		$("#showReceiverList").hide();
		$("#hideReceiverList").show();
	}
	
	function hideReceiverList(){
		$("#receiverInfo").show();
		$("#receiverList").hide();
		$("#showReceiverList").show();
		$("#hideReceiverList").hide();
	}
	
	function selectReceiver(receiverId){
		var queryString = "#" + receiverId;
		var selectedReceiverInfo = $(queryString).html();
		console.log(selectedReceiverInfo);
		
		$("#receiverInfo").html(selectedReceiverInfo);
		$("#receiverList").hide();
		$("#receiverInfo").show();
		$("#hideReceiverList").hide();
		$("#showReceiverList").show();
		$("#receiverBtn").hide();
	}
	
	function deleteItem(productId){
		var queryString = "#" + productId;
		var check = confirm("정말 삭제하시겠습니까?");
		
		if(check){
			$(queryString).remove();
			totalPrice = 0;
			shipFee = 0;
			getTotalPrice();
			getFinalTotalPrice();
			getShipFee();
		}
	}
	function getFinalTotalPrice(){
		var finalTotalPrice = 0;
		
		$('.itemPrice').each(function() {
			finalTotalPrice += parseInt($(this).text());
        });
		finalTotalPrice += shipFee;
		
		$("#finalTotalPrice").text(finalTotalPrice)
	}
	function getTotalPrice(){
		$('.itemPrice').each(function() {
            totalPrice += parseInt($(this).text());
        });
		$("#totalPrice").text(totalPrice)
	}
	
	
	
</script>


<div id="orderForm" style="margin: 0 auto; min-width: 360px">
	<form method="post" action="order" style= "margin: 300px 0">
		<div class="title" style="text-align: center">배송지</div>
		<div>
			<!-- 배송지 정보 (배송지 목록 버튼 클릭시 안보임)-->
			<div id="receiverInfo" style="display: block;">
				<input type="text" name="receiverId" value="${defaultReceiver.receiverId}">
				<div id="receiverPersonName" style="font-weight: bold">
					${defaultReceiver.receiverPersonName}
				</div>
				<div>
					<span id="receiverZip">[${defaultReceiver.receiverZip}]</span>
					<span id="receiverAddress"> ${defaultReceiver.receiverAddress}</span>
					<span id="receiverAddressDetail"> ${defaultReceiver.receiverAddressDetail}</span>
				</div>
				<div>
					휴대전화
				</div>
				<div id="receiverTelno">
					${defaultReceiver.receiverTelno}
				</div>
				<hr>
			</div>
			<!-- 배송지 목록(버튼 클릭시 보임) -->
			<div id="receiverList" style="display: none;">
				<c:forEach var="receiver" items="${receivers}">
					<input type="text" name="receiverId" value="${receiver.receiverId}">
					<div id="${receiver.receiverId}" style="display: block;">
						<div style="font-weight: bold">
							${receiver.receiverPersonName}
						</div>
						<div>
							<span>[${receiver.receiverZip}]</span> 
							<span>${receiver.receiverAddress}</span>
							<span>${receiver.receiverAddressDetail}</span> 
						</div>
						<div>
							휴대전화
						</div>
						<div>
							${receiver.receiverTelno}
						</div>
						<div id="receiverBtn">
							<a id="modifyReceiverBtn" class="btn btn-dark btn-sm" onclick="getModifyForm()">수정</a>
							<a id="selectReceiverBtn" class="btn btn-dark btn-sm" onclick="selectReceiver(${receiver.receiverId})" >선택</a>
						</div>
						<hr>
					</div>
				</c:forEach>
			</div>
			<div id="newReceiverInfo">
			
			</div>
			<div id="showReceiverList">
				<button class="btn btn-dark btn-sm" type="button" onclick="showReceiverList()">배송지 목록</button>
			</div>
			<div id="hideReceiverList" style="display: none;">
				<button class="btn btn-primary btn-sm" type="button" onclick="hideReceiverList()">닫기</button>
			</div>
		</div>
		
		
		
		<!-- 메시지 선택(선택사항) -->
		<div>
			<select style="width: 100%; margin-bottom:30px; border: 0; border-bottom: 1px solid;">
				<option>--메시지 선택(선택사항)--</option>
				<option value="배송 전에 미리 연락 바랍니다.">배송 전에 미리 연락 바랍니다.</option>
				<option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
				<option value="부재 시 문 앞에 놓아주세요.">부재 시 문 앞에 놓아주세요.</option>
				<option value="빠른 배송 부탁드립니다.">빠른 배송 부탁드립니다.</option>
				<option value="택배함에 보관해주세요.">택배함에 보관해주세요.</option>
				<option value="직접 입력">직접 입력</option>
			</select>
		</div>
		<hr>
		
		<!-- 주문 상품 내용  -->
			<div>
				<div class="title">
					주문 상품
				</div>
		<c:forEach var="image" items="${orderProductImageList}" varStatus="status">
				<div id="${productList[status.index].productId + OrderItemList[status.index].productQuantity}" class="orderItems" style="display: flex">
					<img class="orderItemImage" alt="주문할 상품 이미지" src="data:image/jpeg;base64, ${image}" width="200px">
					<div style="display: flex; flex-direction: column; justify-content: space-between; margin: 0 0 0 10px; ">
						<div>
							<input type="text" name="productId" value="${OrderItemList[status.index].productId}">
							<div><a href="#" style="font-weight: bold; color: black">${productList[status.index].productName}</a></div>
							<div>수량: 
								<input type="hidden" name="orderDetailQuantity" value="${OrderItemList[status.index].productQuantity}">
								<span id="itemQuantity">${OrderItemList[status.index].productQuantity}</span>
								개
								</div>
							<div>
								<span>KRW</span>
								<span class="itemPrice">${productList[status.index].productPrice}</span>
							</div>
							<div>
								<input type="hidden" name="">
								<span id="itemSize">${OrderItemList[status.index].productSize}</span>
							</div>
							<div>
								<span id="itemFrame">${OrderItemList[status.index].productFrame}</span>
							</div>
						</div>
						<div style="">
							<button id="" class="btn btn-white btn-sm" type="button" onclick="deleteItem(${productList[status.index].productId + OrderItemList[status.index].productQuantity})">삭제</button>
						</div>
					</div>
				</div>
		</c:forEach>
			</div>
			
			
		<!-- 할인/부가 결제 -->
		<div>
			<div class="title">할인/부가 결제 </div>
			<div>KRW  원</div>
		</div>
		<hr>
		<!-- 적용 금액 -->
		<div>
			<div class="title">적용금액</div>
			<div>-KRW </div>
		</div>
		<!-- 결제 정보 -->
		<div id="paymentInfo" >
			<div class="title">결제 정보</div>
			<table>
				<tr>
					<td>주문 상품</td>
					<td>KRW <span id="totalPrice"></span></td>
				</tr>
				<tr>
					<td>배송비</td>
					<td>+KRW <span id="shipFee"></span></td>
				</tr>
				<tr>
					<td>할인/부가결제</td>
					<td>-KRW 0,000</td>
				</tr>
			</table>
			<div>
				<span>기본 할인 </span>
				<span>-KRW 0,000</span>
			</div>
			<div style="margin: 20px 0; ">
				<span style="">최종 결제 금액</span>
				<span style="font-weight: 600;">KRW <span id="finalTotalPrice" style="font-weight: 600;"></span></span>
			</div>
		</div>
		
		<hr>
		<!-- 결제 수단 -->
		<div>
			<div class="title">결제 수단</div>
			<div>
				<div><input type="radio" checked="checked" disabled="disabled">결제수단 선택</div>
				<div>
					<label><span><input type="radio" name="orderSettlementMethod" value="신용카드">신용카드</span></label>
					<label><span><input type="radio" name="orderSettlementMethod" value="계좌이체">계좌이체</span></label>
					<label><span><input type="radio" name="orderSettlementMethod" value="무통장입금">무통장입금</span></label>
				</div>
				<!-- 신용카드 선택시 -->
				<div>
					<p>최소 결제 가능 금액은 총 결제 금액에서 배송비를 제외한 금액입니다.</p>
					<p>소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</p>
					<label><input type="checkbox"><span>결제 수단과 입력정보를 다음에도 사용</span></label>
				</div>
				<div style="display: none">
					<div>
						<span>예금주명</span>
						<span><input type="text"></span>
					</div>
					<p>소액 결제의 경우 PG사 정책에 따라 결제 금액제한이 있을 수 있습니다.</p>
				</div>
				<div style="display: none">
					<div>
						<span>입금은행</span>
						<span>
							<select>
								<option>:::선택해 주세요:::</option>
								<option>우리은행:1004-000-123456 김철</option>
							</select>
						</span>
					</div>
					<div>
						<span>입금자명</span>
						<span><input type="text"></span>
					</div>
					<p>
						최소 결제 가능 금액은 총 결제금액에서 배송비를 제외한 금액입니다.
					</p>
				</div>
				<hr>
				<!-- 적립 혜택 -->
				<div id="accumulationBenefits">
					<div class="title">
						적립 혜택
					</div>
					<div>
						<table>
							<tr>
								<td>상품별 Mileage</td>
								<td>00,000원</td>
							</tr>
							<tr>
								<td>회원 Mileage</td>
								<td>0원</td>
							</tr>
							<tr>
								<td>쿠폰 Mileage</td>
								<td>0원</td>
							</tr>
						</table>
					</div>
					<div > 
						<span>적립 예정금액</span> 
						<span style="font-weight: bold">00,000원</span>
					</div>
				</div>	
				<div style="text-align: center; margin-top: 80px;" >
					<button class="btn btn-sm btn-dark">Checkout</button>
				</div>
			</div>
		</div>
	</form>
</div>






<%@ include file="/WEB-INF/views/common/footer.jsp"%>