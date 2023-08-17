<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- OrderForm 스타일 설정을 위한 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderFormStyle.css">

<script type="text/javascript">
	var totalPrice = 0;
	var shipFee = 0;
	var finalTotalPrice = 0;
	var totalDiscountAmount = 0;
	$(init);
	function init(){
		getTotalPrice();	
		getDiscountAmount()
		getFinalTotalPrice();
		getShipFee();
		getFinalTotalPrice();
		
		$("#orderDeliveryDemand").change(function() {
			if ($(this).val() === "직접 입력") {
				$("#orderDeliveryDemandInput").css('display', 'block');
			} else {
				$("#orderDeliveryDemandInput").css('display', 'none');
			}
		})
		
		
		
		window.addEventListener("message", function(event) {
			var receiverId = event.data;
			console.log("Received data from child:", receiverId);
			
			$.ajax({
				type: "POST",
				url: "/poster4j/getNewReceiver",
				data: {
					receiverId : receiverId
				},
				success: function(data) {
					$("#receiverId").html(data.receiverId);
					$("#receiverPersonName").html(data.receiverPersonName);
					$("#receiverAddress").html(data.receiverAddress);
					$("#receiverAddressDetail").html(data.receiverAddressDetail);
					$("#receiverTelno").html(data.receiverTelno);
					
				}
			});
		});
	}
	
	function getShipFee(){
		if(finalTotalPrice < 50000){
			shipFee = 3000;
		} else {
			shipFee = 0;
		}
		
		let formattedShipFee = shipFee.toLocaleString(shipFee);
		$("#shipFee").text(formattedShipFee);
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
		
		$("#receiverId").val(receiverId);
		
		$("#receiverInfo").html(selectedReceiverInfo);
		$("#receiverList").hide();
		$("#receiverInfo").show();
		$("#hideReceiverList").hide();
		$("#showReceiverList").show();
		$("#receiverBtn").hide();
		
	}
	
	function deleteItem(index){
		var queryString = "#"+ index;
		var check = confirm("정말 삭제하시겠습니까?");
		
		if(check){
			$(queryString).remove();
			getTotalPrice();
			getDiscountAmount();
			getFinalTotalPrice();
			getShipFee();
			getFinalTotalPrice();
		}
	}
	
	function getFinalTotalPrice() {
		finalTotalPrice = 0;
		
		$('.itemPrice').each(function() {
			finalTotalPrice += parseInt($(this).val());
		});
		finalTotalPrice += shipFee;
		finalTotalPrice -= totalDiscountAmount; // 누적 할인 금액 차감
		
		let formattedFinalTotalPrice = finalTotalPrice.toLocaleString();
		$("#finalTotalPrice").text(formattedFinalTotalPrice);
	}	
	
	function getTotalPrice(){
		totalPrice = 0;
		
		$('.itemPrice').each(function() {
			console.log($(this).val());
            totalPrice += parseInt($(this).val());
        });
		let formattedTotalPrice = totalPrice.toLocaleString();
		$("#totalPrice").text(formattedTotalPrice);
	}
	
	function getDiscountAmount() {
		totalDiscountAmount = 0; // 초기화
		$(".orderItems").each(function() {
			var $item = $(this);
			var itemPrice = parseFloat($item.find(".itemPrice").val());
			var discountRate = parseFloat($item.find(".productDiscountRate").val());
		
			if (!isNaN(itemPrice) && !isNaN(discountRate)) {
				var discountAmount = (itemPrice * discountRate);
				$item.find(".itemDiscountAmount").val(discountAmount);
				totalDiscountAmount += discountAmount; // 누적 할인 금액 추가
			}
		});
		updateTotalDiscountAmount();
	}

	function updateTotalDiscountAmount() {
		let formattedTotalDiscountAmount = totalDiscountAmount.toLocaleString();
		$(".totalDiscountAmount").text("-" + formattedTotalDiscountAmount);
	}
	function completedOrder(){
		alert("주문이 완료되었습니다.");
	}
	
	function changeReceiver() {
		var popupWidth = 400;
		var popupHeight = 480;
		var popupX = (window.screen.width/2)-(popupWidth/2);
		var popupY= (window.screen.height/2)-(popupHeight/2);
		
		window.open("changeReceiverForm", "_blank", "toolbar=no,scrollbars=no,location=no,resizable=yes,status=no,menubar=no,height="+popupHeight+", width="+popupWidth+", left="+popupX+", top="+popupY);
	}
</script>

<div id="body">
	<div class="middle">
		<div class="orderTitle">
			<div style="font-size:25px; font-weight: bold;">ORDER</div>
		</div>
		<form action="postOrder" method="POST">
			<input type="hidden" id="receiverId" name="receiverId" value="${defaultReceiver.receiverId}">
			<div class="deliveryAddress">
				<div class="deliveryAddressHeader">
					받는사람정보
					<a href="javascript:void(0)" onclick="changeReceiver(); return false;" class="btn btn-sm btn-secondary">배송지변경</a>
				</div>
				<table class="deliveryAddressTable">
					<tbody>
						<tr>
							<th>이름</th>
							<td id="receiverPersonName">${defaultReceiver.receiverPersonName}</td>
						</tr>
						<tr>
							<th>배송주소</th>
							<td>
								<span id="receiverAddress">${defaultReceiver.receiverAddress}</span>
								<span id="receiverAddressDetail">${defaultReceiver.receiverAddressDetail}</span>
							</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td id="receiverTelno">${defaultReceiver.receiverTelno}</td>
						</tr>
						<tr>
							<th>배송요청사항</th>
							<td>
								<select id="orderDeliveryDemand" name="orderDeliveryDemand" style="width:300px;">
									<option value="">--메시지 선택(선택사항)--</option>
									<option value="배송 전에 미리 연락 바랍니다.">배송 전에 미리 연락 바랍니다.</option>
									<option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
									<option value="부재 시 문 앞에 놓아주세요.">부재 시 문 앞에 놓아주세요.</option>
									<option value="빠른 배송 부탁드립니다.">빠른 배송 부탁드립니다.</option>
									<option value="택배함에 보관해주세요.">택배함에 보관해주세요.</option>
									<option value="직접 입력">직접 입력</option>
								</select>
								<textarea id="orderDeliveryDemandInput" name="orderDeliveryDemandInput" class="mt-2" cols="50" rows="3" style="display:none" value=""></textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="deliveryItems">
				<div class="deliveryItemsHeader">
					주문상품
				</div>
				<table class="deliveryItemsTable">
					<colgroup>
						<col width="80">
						<col width="220">
						<col width="220">
						<col width="220">
						<col width="220">
						<col width="20">
					</colgroup>
					<thead>
			            <tr class="table-head">
			                <th scope="col">이미지</th>
			                <th scope="col">상품명</th>
			                <th scope="col">옵션</th>
			                <th scope="col">수량</th>
			                <th scope="col">금액</th>
			                <th scope="col"></th>
			            </tr>
		            </thead>
		            <tbody>
		            	<c:forEach var="orderItem" items="${orderItemList}" varStatus="status">
		            		<tr id="${status.index}" class="orderItems mt-2" style="border-bottom:1px solid #e4e4e4;">
		            			
		            			<td class="product-image">
		            				<img class="py-1" style="margin:0; width:80px; height:auto;" src="data:image/jpeg;base64, ${orderProductImageList[status.index]}">
		            			</td>
		            			<td>
		            				${productList[status.index].productName}
		            			</td>
		            			<td>
		            				<div>${orderItem.productSize}</div>
		            				<div>${orderItem.productFrame}</div>
		            			</td>
		            			<td>
		            				${orderItem.productQuantity}
		            			</td>
		            			<td>
		            				<c:if test="${productList[status.index].productDiscountRate > 0}">
		            					<div style="text-decoration:line-through;"><fmt:formatNumber value="${productList[status.index].productPrice}" pattern="#,###"/>원</div>
		            					<div><fmt:formatNumber value="${((1 - productList[status.index].productDiscountRate) * productList[status.index].productPrice).intValue()}" pattern="#,###"/>원</div>
		            				</c:if>
		            			</td>
		            			<td>
		            				<a style="font-size:10px; padding:1.5px 6px; border:1px solid #FF6464; text-decoration:none; color:#FF6464;" 
		            								href="javascript:void(0)" onclick='deleteItem(${status.index}); return false;'>X</a>
		            				<input type="hidden" class="productId" name="productId" value="${orderItem.productId}">
			            			<input type="hidden" name="optionSize" value="${orderItem.productSize}">
			            			<input type="hidden" name="orderDetailQuantity" value="${orderItem.productQuantity}">
			            			<input type="hidden" name="optionFrame" value="${orderItem.productFrame}">
			            			<input type="hidden" name="orderDetailPrice" value="${productList[status.index].productPrice}">
			            			<input type="hidden" class="itemPrice" value="${productList[status.index].productPrice}">
			            			<input type="hidden" class="productDiscountRate" value="${productList[status.index].productDiscountRate}">
		            			</td>
		            		</tr>
		            	</c:forEach>
		            </tbody>
				</table>
			</div>
			<div id="paymentInfo">
				<div class="paymentInfoHeader">
					결제정보
				</div>
				<table class="paymentInfoTable">
					<tbody>
						<tr>
							<th>총 상품가격</th>
							<td style="border-bottom: 1px solid #e4e4e4; padding: 10px 0 10px 16px; padding-top: 12.5px; padding-bottom: 12.5px;">
								<span id="totalPrice" style="font-weight:600;"></span><span>원</span>
							</td>
						</tr>
						<tr>
							<th>할인</th>
							<td style="border-bottom: 1px solid #e4e4e4; padding: 10px 0 10px 16px; padding-top: 12.5px; padding-bottom: 12.5px;">
								<span class="totalDiscountAmount" style="font-weight:600;"></span><span>원</span>
							</td>
						</tr>
						<tr>
							<th>배송비</th>
							<td style="border-bottom: 1px solid #e4e4e4; padding: 10px 0 10px 16px; padding-top: 12.5px; padding-bottom: 12.5px;">
								<span id="shipFee" style="font-weight:600;"></span><span>원</span>
							</td>
						</tr>
						<tr>
							<th>총 결제금액</th>
							<td style="border-bottom: 1px solid #e4e4e4; padding: 10px 0 10px 16px; padding-top: 12.5px; padding-bottom: 12.5px;">
								<span id="finalTotalPrice" style="font-size:15px; font-weight:600;"></span><span>원</span>
							</td>
						</tr>
						<tr>
							<th>결제방법</th>
							<td style="border-bottom: 1px solid #e4e4e4; padding: 10px 0 10px 16px; padding-top: 12.5px; padding-bottom: 12.5px;">
								<label><input type="radio" name="orderSettlementMethod" value="신용카드" checked> 신용카드</label>
      							<label class="ml-3"><input type="radio" name="orderSettlementMethod" value="계좌이체"> 계좌이체</label>
      							<label class="ml-3"><input type="radio" name="orderSettlementMethod" value="무통장입금"> 무통장입금</label>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="margin-top: 20px; text-align: center; position: relative;">
				<button type="submit" onclick="completedOrder();" class="goPaymentBtn" style="text-decoration:none; color:white;">결제하기</button>
			</div>
		</form>
		
	</div>
	
</div>




<%-- 

<div id="orderForm" style="margin: 0 auto; min-width: 360px">
	<form method="post" action="postOrder" style= "margin: 300px 0">
		<div class="title" style="text-align: center">배송지</div>
		<div>
			<!-- 배송지 정보 (배송지 목록 버튼 클릭시 안보임)-->
			<div id="receiverInfo" style="display: block;">
				<input type="hidden" id="receiverId" name="receiverId" value="${defaultReceiver.receiverId}">
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
					<div id="${receiver.receiverId}" style="display: block;">
						<input type="hidden" name="receiverId" value="${receiver.receiverId}">
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
			<div id="showReceiverList">
				<button class="btn btn-dark btn-sm" type="button" onclick="showReceiverList()">배송지 목록</button>
			</div>
			<div id="hideReceiverList" style="display: none;">
				<button class="btn btn-primary btn-sm" type="button" onclick="hideReceiverList()">닫기</button>
			</div>
		</div>
		
		
		
		<!-- 메시지 선택(선택사항) -->
		<div>
			<select name="" style="width: 100%; margin-bottom:30px; border: 0; border-bottom: 1px solid;">
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
					<div id="${status.index}" class="orderItems" style="display: flex">
						<img class="orderItemImage" alt="주문할 상품 이미지" src="data:image/jpeg;base64, ${image}" width="200px">
						<div style="display: flex; flex-direction: column; justify-content: space-between; margin: 0 0 0 10px; ">
							<div>
								<input type="hidden" class="productId" name="productId" value="${orderItemList[status.index].productId}">
								<div><a href="#" style="font-weight: bold; color: black">${productList[status.index].productName}</a></div>
								<div>수량: 
									<input type="hidden" name="orderDetailQuantity" value="${orderItemList[status.index].productQuantity}">
									<span class="itemQuantity">${orderItemList[status.index].productQuantity}</span>
									개
									</div>
								<div>
									<span>KRW</span>
									<input type="hidden" name="orderDetailPrice" value="${productList[status.index].productPrice}">
									<span class="itemPrice">${productList[status.index].productPrice}</span>
								</div>
								<div>
									<input type="hidden" name="optionSize" value="${orderItemList[status.index].productSize}">
									<span class="itemSize">${orderItemList[status.index].productSize}</span>
								</div>
								<div>
									<input type="hidden" name="optionFrame" value="${orderItemList[status.index].productFrame}">
									<span class="itemFrame">${orderItemList[status.index].productFrame}</span>
								</div>
								<div>
									<span class="productDiscountRate">${productList[status.index].productDiscountRate}</span>
								</div>
								<div>
									<span class="itemDiscountAmount"></span>
								</div>
							</div>
							<div style="">
								<button id="" class="btn btn-white btn-sm" type="button" onclick="deleteItem(${status.index})">삭제</button>
							</div>
						</div>
					</div>
			</c:forEach>
		</div>
			
			
		<!-- 할인/부가 결제 -->
		<div>
			<div class="title">할인/부가 결제 </div>
			<div class="totalDiscountAmount">KRW  원</div>
		</div>
		<hr>
		<!-- 적용 금액 -->
		<div>
			<div class="title">적용금액</div>
			<div class="totalDiscountAmount">-KRW </div>
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
					<td class="totalDiscountAmount">-KRW 0,000</td>
				</tr>
			</table>
			<div>
				<span>기본 할인 </span>
				<span class="totalDiscountAmount">-KRW 0,000</span>
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
					<button class="btn btn-sm btn-dark" onclick="completedOrder()">Checkout</button>
				</div>
			</div>
		</div>
	</form>
</div>
 --%>




<%@ include file="/WEB-INF/views/common/footer.jsp"%>