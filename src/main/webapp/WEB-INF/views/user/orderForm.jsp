<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/views/common/header.jsp"%>


<div style="margin: 0 auto">
	<form action="" style= "margin: 300px 0">
		<div>배송지</div>
		<label><input type="checkbox"><span>회원정보와 동일</span> </label>
		<label><input type="checkbox" checked="checked"><span>회원정보와 동일</span> </label>
		<table>
			<tr>
				<th>받는사람</th>
				<td><input type="text" value="${orderCustomer.customerName}"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" value="서울특별시 강북구"></td>
				<td><input type="text" value="상세주소"></td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td>
					<select>
						<option>010</option>
						<option>011</option>
						<option>016</option>
					</select>
					<input type="text" value="휴대폰 번호 앞자리 "><input type="text" value="휴대폰 번호 뒷자리">
				</td>
			</tr>
			<tr>
				<th>이메일 필수</th>
				<td>
					<input type="text" value="이메일 앞">@<input type="text" value="이메일 뒤">
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
			<div>
				
				<img alt="" src="">
			</div>
		</div>
		
	</form>
</div>






<%@ include file="/WEB-INF/views/common/footer.jsp"%>