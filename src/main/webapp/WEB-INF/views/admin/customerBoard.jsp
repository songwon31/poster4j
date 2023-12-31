<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="container-fluid flex-grow-1" style="margin-top:80px;">
	<div class="col">
		<div class="py-2 px-4">
			<div style="font-size: 20px">고객 목록</div>
		</div>
		
		<table class="table">
			<thead>
				<tr>
					<th scope="col"><span class="d-flex justify-content-center">ID</span></th>
					<th scope="col"><span class="d-flex justify-content-center">이름</span></th>
					<th scope="col"><span class="d-flex justify-content-center">연락처</span></th>
					<th scope="col"><span class="d-flex justify-content-center">이메일</span></th>
					<th scope="col"><span class="d-flex justify-content-center">회원정보삭제</span>
				</tr>
			</thead>
			<tbody>	
				<c:forEach var="customer" items="${customerList}" varStatus="status">
					<tr>
						<td class="align-middle" scope="row" style="width:30px;"><span class="d-flex justify-content-center">${customer.customerId}</span></td>
						<td class="align-middle" style="width:30px;"><span class="d-flex justify-content-center">${customer.customerName}</span></td>
						<td class="align-middle" style="width:30px;"><span class="d-flex justify-content-center align-self-center">${customer.customerTelno}</span></td>
						<td class="align-middle" style="width:30px;"><span class="d-flex justify-content-center align-self-center">${customer.customerEmail}</span></td>

						<td class="align-middle" style="width:30px;">
							<form method="get" action="deleteCustomer">
								<input type="hidden" name="customerId" value="${customer.customerId}">
								<span class="d-flex justify-content-center">
									<button class="btn btn-danger btn-sm">삭제</button>
								</span>
							</form>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="12" class="text-center">
						<div>
							<a class="btn btn-outline-primary btn-sm" href="customerBoard?pageNo=1">처음</a>
							<c:if test="${pager.groupNo>1}">
								<a class="btn btn-outline-info btn-sm" href="customerBoard?pageNo=${pager.startPageNo-1}">이전</a>
							</c:if>
							
							<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
								<c:if test="${pager.pageNo != i}">
									<a class="btn btn-outline-success btn-sm" href="customerBoard?pageNo=${i}">${i}</a>
								</c:if>
								<c:if test="${pager.pageNo == i}">
									<a class="btn btn-danger btn-sm" href="customerBoard?pageNo=${i}">${i}</a>
								</c:if>
							</c:forEach>
							
							<c:if test="${pager.groupNo<pager.totalGroupNo}">
								<a class="btn btn-outline-info btn-sm" href="customerBoard?pageNo=${pager.endPageNo+1}">다음</a>
							</c:if>
							<a class="btn btn-outline-primary btn-sm" href="customerBoard?pageNo=${pager.totalPageNo}">맨끝</a>
						</div>
					</td>
				</tr>
			</tbody>
			
		</table>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>