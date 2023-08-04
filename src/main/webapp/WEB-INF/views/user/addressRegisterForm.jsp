<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addressRegisterFormStyle.css">

<div class="wrapper" style="margin: 0 auto; width: 350px; font-size: 13px;">
	<div style="margin-top: 200px;">
		<form method="post" action="addressRegister" style="font-size: 13px;">
			<table class="getInputTable">
				<tr class="addressRegisterInputGroup">
					<td>
						<label for="shipAddressName" class="mr-4">배송지명</label>
					</td>
					<td>
						<input type="text" name="receiverName" class="form-control" value="" style="width: 270px;">
					</td>
				</tr>	
				<tr class="addressRegisterInputGroup">
					<td>
						<label for="customerName" class="mr-4">성명</label>
					</td>
					<td>
						<input type="text" name="customerName" class="form-control" value="">
					</td>
				</tr>
				<tr class="addressRegisterInputGroup">
					<td>
						<label for="receiverAddress" class="mr-4">주소</label>
					</td>
					<td>
						<input type="text" name="receiverZip" class="form-control" placeholder="우편번호" value="" style="font-size: 13px;">
						<input type="text" name="receiverAddress" class="form-control" placeholder="기본주소" value="">
						<input type="text" name="receiverAddressDetail" class="form-control" placeholder="나머지 주소(선택 입력 가능)" value="">
					</td>
				</tr>
				<tr class="addressRegisterInputGroup">
					<td>
						<label for="customerTelno" class="mr-4">휴대전화</label>
					</td>
					<td>
						<input type="text" name="receiverTelno" class="form-control" value="">
					</td>
				</tr>
			</table>
			
			<div class="AddressRegisterBtn" style="width: 100%; text-align: center;">
				<span>
					<input class="btn btn-dark btn-sm mt-3" type="submit" value="등록"/>
				</span>
				<span >
					<input class="btn btn-dark btn-sm mt-3" type="submit" value="취소"/>
				</span>
			</div>
		</form>
	</div>
</div>

















<%@ include file="/WEB-INF/views/common/footer.jsp"%>