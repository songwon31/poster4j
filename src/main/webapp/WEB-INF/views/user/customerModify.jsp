<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/customerModify.css">

<script>
	$(init);

	function goHome(){
	    location.href = "${pageContext.request.contextPath}/";
	}
	
	function modifyName() {
		let customerName = $("#customerName").val();
		$.ajax({
			type: "POST",
			url: "/poster4j/modifyName",
			data: {
				customerName : customerName
			},
			success: function() {
			}
		});
	}
	
	function modifyTelno() {
		let customerTelno = $("#customerTelno").val();
		$.ajax({
			type: "POST",
			url: "/poster4j/modifyTelno",
			data: {
				customerTelno : customerTelno
			},
			success: function() {
			}
		});
	}
	
	function modifyEmail() {
		let customerEmail = $("#customerEmail").val();
		$.ajax({
			type: "POST",
			url: "/poster4j/modifyEmail",
			data: {
				customerEmail : customerEmail
			},
			success: function() {
			}
		});
	}
	
	function modifyPassword() {
		let currentPassword = $("#currentPassword").val();
		let newPassword1 = $("#newPassword1").val();
		let newPassword2 = $("#newPassword2").val();
		$.ajax({
			type: 'POST',
			url: '/poster4j/modifyPassword',
			data: {
				currentPassword : currentPassword,
				newPassword1 : newPassword1,
				newPassword2 : newPassword2
			},
			success: function(data) {
				$("#currentPassword").val("");
				$("#currentPassword").html("");
				$("#newPassword1").val("");
				$("#newPassword1").html("");
				$("#newPassword2").val("");
				$("#newPassword2").html("");
			}
		});
	}
	
	function init() {
		$("#customerSmsAgree").click(function() {
			if (this.checked) {
				$.ajax({
					type: "POST",
					url: "/poster4j/smsCheck",
					success: function() {}
				});
			} else {
				$.ajax({
					type: "POST",
					url: "/poster4j/smsUncheck",
					success: function() {}
				});
			}
		})
		
		$("#customerEmailAgree").click(function() {
			if (this.checked) {
				$.ajax({
					type: "POST",
					url: "/poster4j/emailCheck",
					success: function() {}
				});
			} else {
				$.ajax({
					type: "POST",
					url: "/poster4j/emailUncheck",
					success: function() {}
				});
			}
		})
	}
	
	
</script>

<div class="wrapper" style="margin-top:60px;">
	<div id="container">
		<div id="contents">
			<div id="title">
				<div style="font-size:25px; font-weight: bold;">회원정보수정</div>
			</div>
			<table class="usermodify-table">
                <tbody>
	                <tr>
	                    <th scope="row">이름</th>
	                    <td>
	                    	<input id="customerName" type="text" name="customerName" value="${customer.customerName}">
	                    	<a href="javascript:void(0)" onclick="modifyName(); return false;" class="btn btn-sm btn-secondary ml-3" style="border-radius:0px">이름 변경</a>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row">휴대폰 번호</th>
	                    <td>
	                    	<input id="customerTelno" type="text" name="customerTelno" value="${customer.customerTelno}">
	                    	<a href="javascript:void(0)" onclick="modifyTelno(); return false;" class="btn btn-sm btn-secondary ml-3" style="border-radius:0px">전화번호 변경</a>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row">이메일</th>
	                    <td>
	                    	<input id="customerEmail" type="text" name="customerEmail" value="${customer.customerEmail}">
	                    	<a href="javascript:void(0)" onclick="modifyEmail(); return false;" class="btn btn-sm btn-secondary ml-3" style="border-radius:0px">이메일 변경</a>
	                    </td>
	                </tr>
	                
	                <tr>
	                    <th scope="row">비밀번호</th>
	                    <td>
	                       	<div class="mb-3">
	                       		<span style="display:inline-block; width: 120px;">현재 비밀번호</span>
	                       		<input id="currentPassword" type="password" name="currentPassword" value="">
	                       	</div>
	                   		<div class="mb-3">
	                       		<span style="display:inline-block; width: 120px;">새 비밀번호</span>
	                       		<input id="newPassword1" type="password" name="newPassword1" value="">
	                       	</div>
	                       	<div class="mb-3">
	                       		<span style="display:inline-block; width: 120px;">비밀번호 다시 입력</span>
	                       		<input id="newPassword2" type="password" name="newPassword2" value="">
	                       	</div>
	                       	<div>
	                       		<a href="javascript:void(0)" onclick="modifyPassword(); return false;" class="btn btn-sm btn-secondary" style="border-radius:0px; margin-left:200px;">비밀번호 변경</a>
	                       	</div>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row">수신설정</th>
	                    <td>
	                    	<div>
	                    		<span style="display:inline-block; width: 100px;">SMS 수신동의</span>
	                    		<c:if test='${customer.customerSmsAgree.equals("TRUE")}'><input id="customerSmsAgree" type="checkbox" name="customerSmsAgree" checked="checked"></c:if>
	                    		<c:if test='${customer.customerSmsAgree.equals("FALSE")}'><input id="customerSmsAgree" type="checkbox" name="customerSmsAgree"></c:if>
	                    	</div>
	                    	<div class="mt-2">
	                    		<span style="display:inline-block; width: 100px;">이메일 수신동의</span>
	                    		<c:if test='${customer.customerEmailAgree.equals("TRUE")}'><input id="customerEmailAgree" type="checkbox" name="customerEmailAgree" checked="checked"></c:if>
	                    		<c:if test='${customer.customerEmailAgree.equals("FALSE")}'><input id="customerEmailAgree" type="checkbox" name="customerEmailAgree"></c:if>
	                    	</div>
	                    </td>
	                </tr>
                </tbody>
            </table>
			<div class="foot">
				<span><button onclick="goHome();" class="btn btn-dark" style="border-radius:0px">홈으로</button></span>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>