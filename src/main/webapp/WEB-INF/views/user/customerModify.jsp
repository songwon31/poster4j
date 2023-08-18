<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/customerModify.css">

<div class="wrapper" style="margin-top:60px;">
	<div id="container">
		<div id="contents">
			<div id="title">
				<div style="font-size:25px; font-weight: bold;">회원정보수정</div>
			</div>
			<table class="usermodify-table">
                <tbody>
                <tr>
                    <th scope="row">아이디</th>
                    <td>
                    	<form>
                    		<input type="text" name="customerId" value="${customer.customerId}">
                    	</form>
                    </td>
                </tr>
                <tr>
                    <th scope="row">비밀번호</th>
                    <td>
                        <input name="customerPassword" type="password">
                    </td>
                </tr>
                </tbody>
            </table>
			<div class="foot">
				<span><button class="btn btn-dark" style="border-radius:0px">확인</button></span>
				<span><button type="button" onclick="goHome();" class="btn btn-secondary" style="border-radius:0px">취소</button></span>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>