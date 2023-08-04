<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- OrderForm 스타일 설정을 위한 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderFormStyle.css">

<div id="orderForm" style="margin: 0 auto; min-width: 360px">
	<form action="" style= "margin: 300px 0">
		<div style="text-align: center">배송지</div>
		<div>
			<label><input type="checkbox"><span>회원정보와 동일</span> </label>
			<label><input type="checkbox" checked="checked"><span>새로운 배송지</span> </label>
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
						<input type="text" value="서울특별시 강북구" style="width: 70%"><button style="width: 50x;">Search</button>
					</div>
					<div>
						<input type="text" value="상세주소" style="width: 100%">
					</div>
				</td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td>
					<select>
						<option>010</option>
						<option>011</option>
						<option>016</option>
					</select>
					<input type="text" value="0000" style="width: 70px"><input type="text" value="0000" style="width:70px">
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
				<option>배송 전에 미리 연락 바랍니다.</option>
				<option>부재 시 경비실에 맡겨주세요.</option>
				<option>부재 시 문 앞에 놓아주세요.</option>
				<option>빠른 배송 부탁드립니다.</option>
				<option>택배함에 보관해주세요.</option>
				<option>직접 입력</option>
			</select>
		</div>
		<div>
			<input type="checkbox"><span>기본 배송지로 저장</span>
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
					<button>삭제</button>
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
	</form>
</div>






<%@ include file="/WEB-INF/views/common/footer.jsp"%>