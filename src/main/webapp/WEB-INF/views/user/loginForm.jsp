<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loginFormStyle.css"/>

<div class="wrapper">
	<div class="loginContent d-flex justify-content-center">
		<form method="post" action="login">
			<c:if test="${error != null}">
				<div class="alert alert-danger mb-2 form-control" style="line-height: 1;" role="alert">
				  ${error}
				</div>			
			</c:if>
			<table class="loginInputTable mb-3">
				<tr class="loginInputGroup">
					<td>
						<label for="customerId" class="mr-4">ID</label>
					</td>
					<td>
						<input type="text" name="customerId" class="form-control" value="">
					</td>
				</tr>
				<tr class="loginInputGroup">
					<td>
						<label for="customerPassword" class="mr-4">Password</label>
					</td>
					<td>
						<input type="password" name="customerPassword" class="form-control" value="">
					</td>
				</tr>
			</table>
			<div class="btnGroup d-flex row">
				<input class="btn btn-sm btn-dark col" type="submit" value="Login"/>
				<a class="joinBtn btn btn-sm col" href="join">Join</a>
			</div>
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>