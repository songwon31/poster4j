<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>


<div id="addressList" style="margin: 0 auto">
	<div style="margin-top: 200px; min-width: 1080px;">
		<table class="table">
			<thead class="border">
				<tr>
					<th scope="col"><input type="checkbox"></th>
					<th scope="col">배송지명</th>
					<th scope="col">수령인</th>
					<th scope="col">휴대전화</th>
					<th scope="col">주소</th>
					<th scope="col">수정</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="col"><input type="checkbox"></th>
					<td scope="row">집</td>
					<td>김철</td>
					<td>010-1234-1234</td>
					<td>[00000][서울특별시 종로구 창경궁로 254] [402호]</td>
					<td>
						<form class="form-inline" method="get" action="changeAddress">
							<button type="submit" class="btn btn-dark btn-sm ml-2">수정</button>
						</form>
					</td>
				</tr>
			</tbody>
		</table>
		<div style="text-align: center;">
			<span><a class="btn btn-dark">선택 주소록 삭제</a></span>
			<span><a class="btn btn-dark">배송지등록</a></span>
		</div>
	</div>

</div>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>