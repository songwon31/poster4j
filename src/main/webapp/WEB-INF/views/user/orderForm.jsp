<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- OrderForm 스타일 설정을 위한 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderFormStyle.css">

<div id="orderForm" style="margin: 0 auto; min-width: 360px">
	<form action="" style= "margin: 300px 0">
		<div style="text-align: center">배송지</div>
		<div>
			<label><input type="radio" name="shipping" checked="checked"><span>회원정보와 동일</span> </label>
			<label><input type="radio" name="shipping"><span>새로운 배송지</span> </label>
		</div>
		<table>
			<tr >
				<th>받는사람</th>
				<td>
					<input type="text" value="${orderCustomer.customerName}" style="width: 100%">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td style="display: inline-block; width: 100%">
					<div style="width: 100%">
						<input type="text" value="우편번호" style="width: 70%"><button style="width: 50x;">Search</button>
					</div>
					<div>
						<input type="text" value="주소" style="width: 100%">
					</div>
					<div>
						<input type="text" value="상세주소" style="width: 100%">
					</div>
				</td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td>
					<input type="text" value="010-0000-0000" style="width: 100%">
				</td>
			</tr>
			<tr>
				<th>이메일 필수</th>
				<td>
					<input type="text" value="poster4j" style="width: 120px">@<input type="text" value="poster.kr" style="width: 120px;">
				</td>
			</tr>
		</table>
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
				<script>
				</script>
			</select>
		</div>
		<div>
			<label><input type="radio"><span>기본 배송지로 저장</span></label>
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