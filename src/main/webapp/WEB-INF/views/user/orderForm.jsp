<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- OrderForm 스타일 설정을 위한 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderFormStyle.css">

<div id="orderForm" style="margin: 0 auto; min-width: 360px">
	<form action="" style= "margin: 300px 0">
		<div style="text-align: center">배송지</div>
		<div>
			<!-- 배송지 정보 (배송지 목록 버튼 클릭시 안보임)-->
			<div id="receiverInfo" style="display: block;">
				<div style="font-weight: bold">
					${defaultReceiver.receiverPersonName}
				</div>
				<div>
					[${defaultReceiver.receiverZip}] ${defaultReceiver.receiverAddress} ${defaultReceiver.receiverAddressDetail}
				</div>
				<div>
					휴대전화
				</div>
				<div>
					${defaultReceiver.receiverTelno}
				</div>
				<hr>
			</div>
			<!-- 배송지 목록(버튼 클릭시 보임) -->
			<div id="receiverList" style="display: none;">
				<c:forEach var="receiver" items="${receivers}">
					<div id="${receiver.receiverId}" style="display: block;">
						<div style="font-weight: bold">
							${receiver.receiverPersonName}
						</div>
						<div>
							[${receiver.receiverZip}] ${receiver.receiverAddress} ${receiver.receiverAddressDetail}
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
			<div id="newReceiver">
			
			</div>
			<div id="showReceiverList">
				<button class="btn btn-dark btn-sm" type="button" onclick="showReceiverList()">배송지 목록</button>
			</div>
			<div id="hideReceiverList" style="display: none;">
				<button class="btn btn-primary btn-sm" type="button" onclick="hideReceiverList()">닫기</button>
			</div>
		</div>
		<script type="text/javascript">
		
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
			
			function getModifyForm(){
			}
		</script>
		
		
		<!-- 메시지 선택(선택사항) -->
		<div>
			<select>
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
			<div>
				주문 상품
			</div>
			<div style="display: flex">
				<img alt="주문할 상품 이미지" src="${pageContext.request.contextPath}/resources/images/poster1.jpg" width="200px">
				<div>
					<div><a>주문할 상품명</a></div>
					<div>수량: n개</div>
					<div><span>KRW  00,000</span></div>
					<a class="btn btn-light btn-sm" href="${pageContext.request.contextPath}">삭제</a>
				</div>
			</div>
		</div>
		<!-- 할인/부가 결제 -->
		<div>
			<div>할인/부가 결제 </div>
			<div>KRW 00,000원</div>
		</div>
		<hr>
		<!-- 적용 금액 -->
		<div>
			<div>적용금액</div>
			<div>-KRW 00,000</div>
		</div>
		<!-- 결제 정보 -->
		<div>
			<div>결제 정보</div>
			<div>
				<div>
					<span>주문 상품</span>
					<span>KRW 00,000</span>
				</div>
				<div>
					<span>배송비</span>
					<span>+KRW 0,000</span>
				</div>
				<div>
					<span>할인/부가결제</span>
					<span>-KRW 0,000</span>
				</div>
				<div>
					<span>기본 할인 <span>
					</span>-KRW 6,900</span>
				</div>
			</div>
			<div>
				<span>최종 결제 금액</span>
				<span>KRW 00,000</span>
			</div>
		</div>
		<hr>
		<!-- 결제 수단 -->
		<div>
			<div>결제 수단</div>
			<div>
				<div><input type="radio" checked="checked" disabled="disabled">결제수단 선택</div>
				<div>
					<label><span><input type="radio" name="pay-method">신용카드</span></label>
					<label><span><input type="radio" name="pay-method">계좌이체</span></label>
					<label><span><input type="radio" name="pay-method">무통장입금</span></label>
				</div>
				<c:if test="">
					<div>
						<p>최소 결제 가능 금액은 총 결제 금액에서 배송비를 제외한 금액입니다.</p>
						<p>소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</p>
						<label><input type="checkbox"><span>결제 수단과 입력정보를 다음에도 사용</span></label>
					</div>
				</c:if>
				
			</div>
		</div>
	</form>
</div>






<%@ include file="/WEB-INF/views/common/footer.jsp"%>