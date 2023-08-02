<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="wrapper">
	<div class="joinContent d-flex justify-content-center">
		<form method="post" action="join">
			<table>
				<tr>
					<td>
						<label for="customer_id" class="">ID</label>
					</td>
					<td>
						<input type="text" name="customer_id" class="form-control" value="">
						<span>(영문소문자/숫자, 4~16자)</span>
					</td>
				</tr>
				<tr>
					<td>
						<label for="customer_password" class="">Password</label>
					</td>
					<td>
						<input type="password" name="customer_password" class="form-control" value="">
						<span>(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)</span>
					</td>
				</tr>
				<tr>
					<td>
						<label for="customer_name" class="">Name</label>
					</td>
					<td>
						<input type="text" name="customer_name" class="form-control" value="">
					</td>
				</tr>
				<tr>
					<td>
						<label for="receiver_address" class="">Address</label>
					</td>
					<td>
						<input type="text" name="receiver_zip" class="form-control" placeholder="우편번호" value="">
						<input type="text" name="receiver_address" class="form-control" placeholder="기본주소" value="">
						<input type="text" name="receiver_address_detail" class="form-control" placeholder="나머지 주소(선택입력가능)" value="">
					</td>
				</tr>
				<tr>
					<td>
						<label for="customer_telno" class="">Tel</label>
					</td>
					<td>
					<input type="text" name="customer_telno" class="form-control" value="">
					</td>
				</tr>
				<tr>
					<td>
						<label for="customer_email" class="">E-mail</label>
					</td>
					<td>
						<input type="text" name="customer_email" class="form-control" value="">
					</td>
				</tr>
				<tr>
					<input class="btn btn-info btn-sm mt-2" type="submit" value="가입"/>
				</tr>	
			</table>
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>