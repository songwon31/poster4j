<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>



<div class="wrapper" style="margin-top:60px;">
	<div id="container">
		<div id="contents">
			<div>회원정보확인</div>
			<form method="post" action="customerModifySubmit">
				<div class="input-group" style="width:100%;">
					<div class="input-group-addon" style="width:35%; text-align:left;"><span class="input-group-text">아이디</span></div>
					<input id="customerId" type="text" name="customerId" class="form-control" style="width:65%; background-color: white;" value="${customer.customerId}">
				</div>
				
				<div class="input-group" style="width:100%;">
					<div class="input-group-addon" style="width:35%; text-align:left;"><span class="input-group-text">이름</span></div>
					<input id="customerName" type="text" name="customerName" class="form-control" style="width:65%;" value="${customer.customerName}" value="${customer.customerName}">
				</div>
								
				<div class="input-group" style="width:100%;">
					<div class="input-group-addon" style="width:35%; text-align:left;"><span class="input-group-text">비밀번호</span></div>
					<input id="customerPassword" type="text" name="customerPassword" class="form-control" style="width:65%;">
				</div>
				
				<div>
					<span><button class="btn btn-sm btn-primary">확인</button></span>
					<span><button class="btn btn-sm btn-secondary">취소</button></span>
				</div>
				
			</form>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>