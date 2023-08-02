<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="wrapper">
	<div class="joinContent d-flex justify-content-center" style="margin-top: 100px;">
		<form method="post" action="join">
			<table>
				<tr>
					<td>
						<label for="customerId" class="mr-4">ID</label>
					</td>
					<td>
						<input type="text" name="customerId" class="form-control" value="">
						<span>(영문소문자/숫자, 4~16자)</span>
					</td>
				</tr>
				<tr>
					<td>
						<label for="customerPassword" class="mr-4">Password</label>
					</td>
					<td>
						<input type="password" name="customerPassword" class="form-control" value="">
						<span>(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)</span>
					</td>
				</tr>
				<tr>
					<td>
						<label for="customerName" class="mr-4">Name</label>
					</td>
					<td>
						<input type="text" name="customerName" class="form-control" value="">
					</td>
				</tr>
				<tr>
					<td>
						<label for="receiverAddress" class="mr-4">Address</label>
					</td>
					<td>
						<input type="text" name="receiverZip" class="form-control" placeholder="우편번호" value="">
						<input type="text" name="receiverAddress" class="form-control" placeholder="기본주소" value="">
						<input type="text" name="receiverAddressDetail" class="form-control" placeholder="나머지 주소(선택 입력 가능)" value="">
					</td>
				</tr>
				<tr>
					<td>
						<label for="customerTelno" class="mr-4">Tel</label>
					</td>
					<td>
					<input type="text" name="customerTelno" class="form-control" value="">
					</td>
				</tr>
				<tr>
					<td>
						<label for="customerEmail" class="mr-4">E-mail</label>
					</td>
					<td>
						<input type="text" name="customerEmail" class="form-control" value="">
					</td>
				</tr>
			</table>
			<a class="btn btn-dark mt-2" type="submit" style="text-align: center;">Join</a>
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>